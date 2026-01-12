import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/checkout/custom_checkout_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../features/payments/blocs/payment_methods_bloc.dart';
import '../../features/payments/blocs/payment_methods_event.dart';
import '../../features/payments/blocs/payment_methods_state.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_fonts.dart';

enum PaymentType { card, cash, paypal }

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  PaymentType _type = PaymentType.card;

  @override
  void initState() {
    super.initState();
    // підстрахуємось, якщо сторінку відкрили після addCard
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentMethodsBloc>().add(const PaymentMethodsEvent.fetch());
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
          'Checkout',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w600semiBold,
            fontSize: 22.0,
            height: 1,
            letterSpacing: -0.3,
            color: AppColors.dark,
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: CustomButtonsWidget(
            label: 'MAKE PAYMENT',
            onPressed: () {
              // TODO: наступний крок — create PaymentIntent на Strapi і підтвердити оплату
              context.go(AppRoutes.trackOrder);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomCheckoutWidget(
              checkoutDelivery: 2,
              checkoutAddress: 2,
              checkoutPayment: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // --- Saved Cards header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Saved Cards'),
                          TextButton(
                            onPressed: () async {
                              await context.push(AppRoutes.addNewCard);
                              if (mounted) {
                                context.read<PaymentMethodsBloc>().add(
                                  const PaymentMethodsEvent.fetch(),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.icons.addBoxBlack.path),
                                const SizedBox(width: 6),
                                Text(
                                  'Add Card',
                                  style: TextStyle(color: AppColors.orange),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // --- Cards list
                      BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                        builder: (context, state) {
                          if (state.loading) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (state.cards.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'No saved cards yet. Tap "Add Card".',
                                style: TextStyle(color: AppColors.softGray),
                              ),
                            );
                          }

                          return Column(
                            children:
                                state.cards.map((c) {
                                  final selected =
                                      _type == PaymentType.card &&
                                      state.selectedId == c.id;

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () => _type = PaymentType.card,
                                        );
                                        context.read<PaymentMethodsBloc>().add(
                                          PaymentMethodsEvent.select(c.id),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.gray1,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          border: Border.all(
                                            color:
                                                selected
                                                    ? AppColors.orange
                                                    : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${c.brand.toUpperCase()} •••• ${c.last4}',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppFonts.fontFamily,
                                                    fontWeight:
                                                        AppFonts.w600semiBold,
                                                    color: AppColors.dark,
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  'Exp: ${c.expMonth.toString().padLeft(2, '0')}/${c.expYear}',
                                                  style: TextStyle(
                                                    color: AppColors.softGray,
                                                  ),
                                                ),
                                                if (c.isDefault)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 6,
                                                        ),
                                                    child: Text(
                                                      'Default',
                                                      style: TextStyle(
                                                        color: AppColors.orange,
                                                        fontWeight:
                                                            AppFonts.w500medium,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            CustomCircleCheckBoxWidget(
                                              isSelected: selected,
                                              onPressed: () {
                                                setState(
                                                  () =>
                                                      _type = PaymentType.card,
                                                );
                                                context
                                                    .read<PaymentMethodsBloc>()
                                                    .add(
                                                      PaymentMethodsEvent.select(
                                                        c.id,
                                                      ),
                                                    );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          );
                        },
                      ),

                      const SizedBox(height: 22),

                      // --- Cash
                      _paymentTile(
                        title: 'Cash Payment',
                        icon: Assets.icons.cashonIcon.path,
                        selected: _type == PaymentType.cash,
                        onTap: () => setState(() => _type = PaymentType.cash),
                      ),

                      const SizedBox(height: 20.0),

                      // --- Paypal
                      _paymentTile(
                        title: 'Paypal',
                        icon: Assets.icons.paypal.path,
                        selected: _type == PaymentType.paypal,
                        onTap: () => setState(() => _type = PaymentType.paypal),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String title,
    required String icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: selected ? AppColors.orange : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(width: 15.0),
                  Text(title),
                ],
              ),
              CustomCircleCheckBoxWidget(
                isSelected: selected,
                onPressed: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
