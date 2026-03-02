import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../features/notifications/app_notifications.dart';
import '../../features/order/data/orders_repository.dart';
import '../../features/track/blocs/track_order_bloc.dart';
import '../../features/track/blocs/track_order_event.dart';
import '../../features/track/blocs/track_order_state.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key, required this.documentId});
  final String documentId;

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  final _mapController = MapController();
  bool _cameraInitialized = false;

  void _fitRouteOnce(List<LatLng> route, {LatLng? courier, LatLng? client}) {
    if (_cameraInitialized) return;

    final pts = <LatLng>[
      ...route,
      if (courier != null) courier,
      if (client != null) client,
    ];

    if (pts.isEmpty) return;

    if (pts.length == 1) {
      _mapController.move(pts.first, 14);
      _cameraInitialized = true;
      return;
    }

    var minLat = pts.first.latitude;
    var maxLat = pts.first.latitude;
    var minLng = pts.first.longitude;
    var maxLng = pts.first.longitude;

    for (final p in pts) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    final bounds = LatLngBounds(LatLng(minLat, minLng), LatLng(maxLat, maxLng));

    _mapController.fitCamera(
      CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(64)),
    );

    _cameraInitialized = true;
  }

  Future<void> _openConfirmDialog(BuildContext context) async {
    final bloc = context.read<TrackOrderBloc>();
    final repo = context.read<OrdersRepository>();

    final o = bloc.state.order;
    if (o == null) return;
    if (bloc.state.locked) return;

    bloc.add(const TrackOrderDialogOpened());

    final decision = await showDialog<_Decision>(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: const Text('Order delivered'),
            content: const Text('Confirm delivery or decline this order?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, _Decision.decline),
                child: const Text('Decline'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, _Decision.confirm),
                child: const Text('Confirm'),
              ),
            ],
          ),
    );

    if (!mounted) return;

    try {
      if (decision == _Decision.confirm) {
        await repo.confirmMine(documentId: o.documentId);
      } else if (decision == _Decision.decline) {
        await repo.cancelMine(documentId: o.documentId);
      } else {
        return;
      }

      bloc.add(const TrackOrderFinishAndLock());
      if (mounted) context.go(AppRoutes.order);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Action failed: $e')));
    }
  }

  String _statusText(TrackOrderState s) {
    final o = s.order;
    if (o == null) return '...';

    final status = o.orderStatus.trim().toLowerCase();

    if (o.clientConfirmed == true) return '$status • confirmed';
    if (status == 'cancelled' || status == 'canceled') return status;

    if (status == 'completed') return 'completed • awaiting confirmation';
    if (s.atEnd && !s.locked) return 'completed • awaiting confirmation';

    return 'in_progress';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackOrderBloc, TrackOrderState>(
      listenWhen:
          (prev, next) =>
              prev.notifyArrived != next.notifyArrived ||
              prev.error != next.error,
      listener: (context, state) async {
        if (state.error != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error!)));
          return;
        }

        if (state.notifyArrived) {
          await AppNotifications.instance.showCourierArrived(
            documentId: widget.documentId,
          );

          if (!context.mounted) return;
          context.read<TrackOrderBloc>().add(
            const TrackOrderNotificationShown(),
          );
        }
      },
      child: BlocBuilder<TrackOrderBloc, TrackOrderState>(
        builder: (context, s) {
          final courier = s.courier;
          final route = s.route;
          final clientPoint = s.clientPoint;
          final remaining = s.remainingRoute;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            _fitRouteOnce(route, courier: courier, client: clientPoint);
          });

          final markers = <Marker>[];

          if (clientPoint != null) {
            markers.add(
              Marker(
                point: clientPoint,
                width: 44,
                height: 44,
                child: _pin(
                  color: const Color(0xFF1CAF5E),
                  icon: Icons.person_pin,
                ),
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
                  tooltip: 'Refresh',
                  onPressed: () {
                    _cameraInitialized = false;
                    context.read<TrackOrderBloc>().add(const TrackOrderBoot());
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: AppColors.orange,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: const MapOptions(
                    initialCenter: LatLng(40.7419, -73.9900),
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

                    if (route.length >= 2)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: route,
                            strokeWidth: 5,
                            color: AppColors.gray1.withValues(alpha: 0.55),
                          ),
                        ],
                      ),

                    if (remaining.length >= 2)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: remaining,
                            strokeWidth: 5,
                            color: AppColors.orange.withValues(alpha: 0.85),
                          ),
                        ],
                      ),

                    if (courier != null)
                      DragMarkers(
                        markers: [
                          DragMarker(
                            point: courier,
                            size: const Size(44, 44),
                            builder: (context, point, isDragging) {
                              return _pin(
                                color:
                                    s.locked
                                        ? AppColors.gray1
                                        : AppColors.orange,
                                icon: Icons.delivery_dining,
                              );
                            },
                            onDragUpdate:
                                s.locked
                                    ? null
                                    : (details, rawPoint) {
                                      context.read<TrackOrderBloc>().add(
                                        TrackOrderDragUpdate(
                                          rawPoint: rawPoint,
                                        ),
                                      );
                                    },
                            onDragEnd:
                                s.locked
                                    ? null
                                    : (details, point) {
                                      context.read<TrackOrderBloc>().add(
                                        const TrackOrderDragEnd(),
                                      );
                                    },
                          ),
                        ],
                      ),

                    MarkerLayer(markers: markers),
                  ],
                ),

                if (s.loading)
                  const Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: _TopMessage(text: 'Loading...'),
                  ),

                if (s.order != null)
                  Positioned(
                    top: 62,
                    left: 16,
                    child: _StatusChip(text: _statusText(s)),
                  ),

                if (s.pendingDecision && !s.locked)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 170,
                    child: ElevatedButton(
                      onPressed: () => _openConfirmDialog(context),
                      child: const Text('Open confirmation'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget _pin({required Color color, required IconData icon}) {
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

enum _Decision { confirm, decline }

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

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(999),
      color: Colors.black.withValues(alpha: 0.55),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
