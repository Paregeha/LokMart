import 'package:latlong2/latlong.dart';

class TrackOrderSnapshot {
  TrackOrderSnapshot({
    required this.route,
    required this.passedIndex,
    required this.courier,
    required this.pendingDecision,
    required this.dialogAlreadyShown,
  });

  final List<LatLng> route;
  final int passedIndex;
  final LatLng? courier;
  final bool pendingDecision;
  final bool dialogAlreadyShown;
}

class TrackOrderCache {
  TrackOrderCache._();
  static final TrackOrderCache instance = TrackOrderCache._();

  final Map<String, TrackOrderSnapshot> _mem = {};

  TrackOrderSnapshot? get(String documentId) => _mem[documentId];

  void put(String documentId, TrackOrderSnapshot snapshot) {
    _mem[documentId] = snapshot;
  }

  void clear(String documentId) {
    _mem.remove(documentId);
  }
}
