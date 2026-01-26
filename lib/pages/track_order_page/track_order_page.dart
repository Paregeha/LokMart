import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  final _mapController = MapController();

  LatLng? _client;
  LatLng? _courier;
  List<LatLng> _route = [];

  bool _loading = true;
  String? _error;

  Timer? _tick;
  int _routeIndex = 0;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  Future<void> _init() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = await _getMyLocation();
      _client = client;

      _courier = LatLng(client.latitude + 0.01, client.longitude - 0.01);

      _route = await _fetchRouteOSRM(from: _courier!, to: _client!);

      _mapController.move(_client!, 14);

      _startCourierSimulation();

      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  Future<LatLng> _getMyLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission perm = await Geolocator.checkPermission();
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
    return LatLng(pos.latitude, pos.longitude);
  }

  Future<List<LatLng>> _fetchRouteOSRM({
    required LatLng from,
    required LatLng to,
  }) async {
    final url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${from.longitude},${from.latitude};${to.longitude},${to.latitude}'
        '?overview=full&geometries=geojson';

    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) {
      throw Exception('OSRM error: ${res.statusCode} ${res.body}');
    }

    final json = jsonDecode(res.body) as Map<String, dynamic>;
    final routes = (json['routes'] as List?) ?? [];
    if (routes.isEmpty) throw Exception('No routes returned');

    final geom = (routes.first as Map<String, dynamic>)['geometry'];
    final coords = (geom as Map<String, dynamic>)['coordinates'] as List;

    return coords.map((p) {
      final lon = (p as List)[0] as num;
      final lat = p[1] as num;
      return LatLng(lat.toDouble(), lon.toDouble());
    }).toList();
  }

  void _startCourierSimulation() {
    _tick?.cancel();
    if (_route.length < 2) return;

    _routeIndex = 0;

    _tick = Timer.periodic(const Duration(milliseconds: 700), (_) {
      if (!mounted) return;
      if (_routeIndex >= _route.length) {
        _tick?.cancel();
        return;
      }

      setState(() {
        _courier = _route[_routeIndex];
        _routeIndex += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final client = _client;
    final courier = _courier;

    final markers = <Marker>[];
    if (client != null) {
      markers.add(
        Marker(
          point: client,
          width: 44,
          height: 44,
          child: _pin(color: const Color(0xFF1CAF5E), icon: Icons.person_pin),
        ),
      );
    }
    if (courier != null) {
      markers.add(
        Marker(
          point: courier,
          width: 44,
          height: 44,
          child: _pin(color: AppColors.orange, icon: Icons.delivery_dining),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: const Text(
          'Track Order',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w600semiBold,
            fontSize: 22.0,
            color: AppColors.dark,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.home),
          icon: SvgPicture.asset(
            Assets.icons.icBack.path,
            width: 24,
            height: 24,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Refresh location',
            onPressed: _init,
            icon: const Icon(Icons.refresh, color: AppColors.orange, size: 26),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: client ?? const LatLng(40.7419, -73.9900),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.app',
                retinaMode: RetinaMode.isHighDensity(context),
              ),

              if (_route.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _route,
                      strokeWidth: 5,
                      color: AppColors.orange.withValues(alpha: 0.75),
                    ),
                  ],
                ),

              MarkerLayer(markers: markers),
            ],
          ),

          if (_loading)
            const Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _TopMessage(text: 'Loading map & route...'),
            ),

          if (_error != null)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _TopMessage(text: _error!, isError: true),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 46.0,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.gray1,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 56.0,
                            height: 56.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Assets.images.man.image(
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 21.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Devin Joseph',
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontSize: 18.0,
                                  letterSpacing: -0.24,
                                  color: AppColors.dark,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text('ID 2445556'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.phoneCall.path),
                          const SizedBox(width: 23.0),
                          SvgPicture.asset(Assets.icons.chat.path),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pin({required Color color, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}

class _TopMessage extends StatelessWidget {
  const _TopMessage({required this.text, this.isError = false});

  final String text;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(14),
      color:
          isError ? Colors.red.shade600 : Colors.black.withValues(alpha: 0.75),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
