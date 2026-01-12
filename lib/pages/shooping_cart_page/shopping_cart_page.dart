import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_shopping_cart_widget.dart';
import 'package:flutter_base_architecture/widgets/checkout/custom_checkout_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../features/cart/blocs/cart_bloc.dart';
import '../../features/cart/blocs/cart_event.dart';
import '../../features/cart/blocs/cart_state.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  static const double _deliveryFee = 10.08;
  static const double _taxesFee = 15.02;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartBloc>().add(const CartEvent.load());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'ShoppingCart',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w600semiBold,
            fontSize: 22.0,
            height: 1,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            Assets.icons.icBack.path,
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomCheckoutWidget(checkoutDelivery: 1),
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    failure:
                        (message) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontSize: 14,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ),
                    success: (items, total) {
                      final itemTotal = total;
                      final orderTotal = itemTotal + _deliveryFee + _taxesFee;

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),

                              for (final it in items) ...[
                                CustomShoppingCartWidget(
                                  itemId: it.id,
                                  title: it.product.name,
                                  category: it.product.categoryName ?? '',
                                  imageUrl: it.product.photoUrl,
                                  // ✅ якщо discount є — це "ціна зараз",
                                  // а звичайна піде як oldPrice
                                  price:
                                      (it.product.priceWithDiscount != null &&
                                              (it.product.priceWithDiscount ??
                                                      0) >
                                                  0)
                                          ? (it.product.priceWithDiscount ?? 0)
                                          : (it.product.price ?? 0),
                                  oldPrice:
                                      (it.product.priceWithDiscount != null &&
                                              (it.product.priceWithDiscount ??
                                                      0) >
                                                  0)
                                          ? (it.product.price ?? 0)
                                          : null,
                                  count: it.count,
                                  onInc:
                                      () => context.read<CartBloc>().add(
                                        CartEvent.inc(item: it),
                                      ),
                                  onDec:
                                      () => context.read<CartBloc>().add(
                                        CartEvent.dec(item: it),
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                              ],

                              const SizedBox(height: 45.0),

                              Row(
                                children: [
                                  Text(
                                    'Bill Details',
                                    style: TextStyle(
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w600semiBold,
                                      color: AppColors.dark,
                                      fontSize: 18.0,
                                      height: 1,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24.0),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w500medium,
                                      height: 1,
                                      letterSpacing: 0,
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                  Text(
                                    '\$${itemTotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: AppFonts.w500medium,
                                      fontFamily: AppFonts.fontFamily,
                                      fontSize: 16.0,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24.0),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery Free 9.71 kms',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w500medium,
                                      height: 1,
                                      letterSpacing: 0,
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                  Text(
                                    '+ \$${_deliveryFee.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: AppFonts.w500medium,
                                      fontFamily: AppFonts.fontFamily,
                                      fontSize: 16.0,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24.0),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Texes and Charge',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w500medium,
                                      height: 1,
                                      letterSpacing: 0,
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                  Text(
                                    '+ \$${_taxesFee.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: AppFonts.w500medium,
                                      fontFamily: AppFonts.fontFamily,
                                      fontSize: 16.0,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15.0),
                              const Divider(height: 1, color: AppColors.gray1),
                              const SizedBox(height: 21.0),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Total',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: AppFonts.w600semiBold,
                                      fontFamily: AppFonts.fontFamily,
                                      fontSize: 16.0,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Text(
                                    '\$${orderTotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: AppFonts.w600semiBold,
                                      fontFamily: AppFonts.fontFamily,
                                      fontSize: 17.0,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 34),

                              CustomButtonsWidget(
                                label: 'CHECKOUT',
                                enable: items.isNotEmpty,
                                onPressed: () {
                                  context.push(AppRoutes.checkoutAddress);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
