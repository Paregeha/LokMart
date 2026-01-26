class OrderModel {
  factory OrderModel.fromStrapiItem(Map<String, dynamic> item) {
    final attrs = item;

    final route = (attrs['route'] as Map?)?.cast<String, dynamic>() ?? {};
    final pts = (route['points'] as List?) ?? const [];

    int toInt(dynamic v) {
      if (v is int) return v;
      return int.tryParse('$v') ?? 0;
    }

    return OrderModel(
      id: (attrs['id'] ?? '').toString(),
      documentId: (attrs['documentId'] ?? '').toString(),
      orderStatus: (attrs['orderStatus'] ?? '').toString(),
      orderNumber: (attrs['orderNumber'] ?? '').toString(),
      amount: toInt(attrs['amount']),
      currency: (attrs['currency'] ?? '').toString(),
      routePoints:
          pts.whereType<Map>().map((e) => e.cast<String, dynamic>()).map((e) {
            final lat = (e['lat'] as num).toDouble();
            final lng = (e['lng'] as num).toDouble();
            return {'lat': lat, 'lng': lng};
          }).toList(),
      timeline:
          ((attrs['timeline'] as List?) ?? const [])
              .whereType<Map>()
              .map((e) => e.cast<String, dynamic>())
              .toList(),
      clientConfirmed: (attrs['clientConfirmed'] == true),
    );
  }
  OrderModel({
    required this.id,
    required this.documentId,
    required this.orderStatus,
    required this.orderNumber,
    required this.amount,
    required this.currency,
    required this.routePoints,
    required this.timeline,
    required this.clientConfirmed,
  });

  final String id;
  final String documentId;

  final String orderStatus;

  final String orderNumber;

  final int amount;

  final String currency;

  final List<Map<String, double>> routePoints;

  final List<Map<String, dynamic>> timeline;

  final bool clientConfirmed;
}
