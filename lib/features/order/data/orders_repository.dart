import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../models/order.dart';

class OrdersRepository {
  OrdersRepository({required this.dio});
  final Dio dio;

  Map<String, dynamic> _asMap(dynamic data, {required String where}) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return data.cast<String, dynamic>();
    throw Exception(
      '$where: expected JSON object, got ${data.runtimeType}: $data',
    );
  }

  Future<List<Map<String, double>>> buildRoutePointsToCurrentUser({
    double courierOffsetLat = 0.01,
    double courierOffsetLng = -0.01,
  }) async {
    final client = await _getMyLocation(); // {lat,lng}

    final courier = {
      'lat': client['lat']! + courierOffsetLat,
      'lng': client['lng']! + courierOffsetLng,
    };

    final url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${courier['lng']},${courier['lat']};${client['lng']},${client['lat']}'
        '?overview=full&geometries=geojson';

    final res = await dio.get(url);

    if ((res.statusCode ?? 0) != 200) {
      throw Exception('OSRM error: ${res.statusCode} ${res.data}');
    }

    final body =
        (res.data is String) ? jsonDecode(res.data as String) : res.data;
    final map = _asMap(body, where: 'osrm');

    final routes = (map['routes'] as List?) ?? [];
    if (routes.isEmpty) throw Exception('OSRM: no routes returned');

    final geom = (routes.first as Map)['geometry'];
    if (geom is! Map) throw Exception('OSRM: geometry is invalid');

    final coords = (geom['coordinates'] as List?) ?? [];
    if (coords.isEmpty) throw Exception('OSRM: coordinates empty');

    return coords.map<Map<String, double>>((p) {
      final arr = p as List;
      final lon = (arr[0] as num).toDouble();
      final lat = (arr[1] as num).toDouble();
      return {'lat': lat, 'lng': lon};
    }).toList();
  }

  Future<Map<String, double>> _getMyLocation() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) throw Exception('Location services are disabled');

    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    if (perm == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }
    if (perm == LocationPermission.deniedForever) {
      throw Exception('Location permission denied forever');
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return {'lat': pos.latitude, 'lng': pos.longitude};
  }

  Future<OrderModel> createOrderMine({
    required int amount, // cents
    required String currency,
    required String addressDocumentId,
    required List<Map<String, double>> routePoints,
  }) async {
    final res = await dio.post(
      '/orders/mine',
      data: {
        'amount': amount,
        'currency': currency,
        'addressDocumentId': addressDocumentId,
        'route': {'points': routePoints},
      },
    );

    final body = _asMap(res.data, where: 'createOrderMine');
    final data = body['data'];
    if (data is! Map) {
      throw Exception('createOrderMine: invalid response: $body');
    }

    return OrderModel.fromStrapiItem(data.cast<String, dynamic>());
  }

  Future<List<OrderModel>> fetchMyOrders({String? status}) async {
    final res = await dio.get(
      '/orders/mine',
      queryParameters: {
        if (status != null && status.isNotEmpty) 'status': status,
      },
    );

    final body = _asMap(res.data, where: 'fetchMyOrders');
    final raw = body['data'];
    if (raw is! List) throw Exception('fetchMyOrders: expected data[]');

    return raw
        .whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .map(OrderModel.fromStrapiItem)
        .toList();
  }

  Future<OrderModel> fetchMyOrder({required String documentId}) async {
    final res = await dio.get('/orders/mine/$documentId');
    final body = _asMap(res.data, where: 'fetchMyOrder');
    final data = body['data'];
    if (data is! Map) throw Exception('fetchMyOrder: invalid response: $body');
    return OrderModel.fromStrapiItem(data.cast<String, dynamic>());
  }

  Future<void> confirmMine({required String documentId}) async {
    await dio.post('/orders/mine/$documentId/confirm');
  }

  Future<void> cancelMine({required String documentId}) async {
    await dio.post('/orders/mine/$documentId/cancel');
  }
}
