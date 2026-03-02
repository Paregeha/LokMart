import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/order/blocs/orders_bloc.dart';
import '../../features/order/blocs/orders_event.dart';
import '../../features/order/blocs/orders_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';
import '../../widgets/buttons/custom_drop_down_order_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrdersBloc>().add(const OrdersEvent.fetch(status: null));
    });
  }

  String? _statusByTab(int tab) {
    if (tab == 1) return 'in_progress';
    if (tab == 2) return 'completed';
    if (tab == 3) return 'cancelled';
    return null;
  }

  bool _canTrackOrder(String status, bool clientConfirmed) {
    final s = status.trim().toLowerCase();

    if (clientConfirmed) return false;
    if (s == 'completed') return false;
    if (s == 'cancelled' || s == 'canceled') return false;

    return s == 'in_progress';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 32.0,
        actionsPadding: const EdgeInsets.only(right: 32.0),
        title: const Text(
          'My Order',
          style: TextStyle(fontWeight: AppFonts.w800extraBold),
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: 19),
              itemBuilder: (_, index) {
                final labels = const [
                  'All',
                  'In progress',
                  'Completed',
                  'Cancelled',
                ];
                final selected = _tab == index;

                return GestureDetector(
                  onTap: () {
                    setState(() => _tab = index);
                    context.read<OrdersBloc>().add(
                      OrdersEvent.changeFilter(status: _statusByTab(index)),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color:
                                selected ? AppColors.orange : AppColors.gray1,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(24, 14, 24, 18),
                        child: Text(labels[index]),
                      ),
                      if (selected)
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 7,
                              decoration: const BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              context.read<OrdersBloc>().add(
                                OrdersEvent.fetch(status: state.statusFilter),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state.orders.isEmpty) {
                  return const Center(child: Text('No orders yet'));
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(top: 0, bottom: 12),
                  itemCount: state.orders.length,
                  separatorBuilder: (_, __) => const Divider(height: 1.0),
                  itemBuilder: (context, i) {
                    final o = state.orders[i];
                    final status = o.orderStatus.trim().toLowerCase();

                    final (iconColor, themeColor) = switch (status) {
                      'completed' => (
                        AppColors.white,
                        AppColors.completedOrder,
                      ),
                      'in_progress' => (
                        AppColors.deliveryOrderIcon,
                        AppColors.deliveryOrder,
                      ),
                      'cancelled' ||
                      'canceled' => (AppColors.white, AppColors.canceledOrder),
                      _ => (
                        AppColors.deliveryOrderIcon,
                        AppColors.deliveryOrder,
                      ),
                    };

                    final canTrack = _canTrackOrder(
                      status,
                      o.clientConfirmed == true,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomDropDownOrderWidget(
                        order: o,
                        color: iconColor,
                        colorTheme: themeColor,
                        onTrackPressed:
                            canTrack
                                ? () => context.go(
                                  AppRoutes.trackOrder,
                                  extra: o.documentId,
                                )
                                : null,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
