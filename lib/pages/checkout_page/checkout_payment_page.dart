import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/cart/blocs/cart_bloc.dart';
import '../../features/payments/blocs/checkout_payment_bloc.dart';
import '../../features/payments/blocs/payment_methods_bloc.dart';
import '../../features/payments/blocs/payment_methods_event.dart';
import '../../features/payments/blocs/payment_methods_state.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';
import '../../widgets/buttons/custom_button_widget.dart';
import '../../widgets/buttons/custom_circle_check_box_widget.dart';
import '../../widgets/checkout/custom_checkout_widget.dart';
import '../../widgets/credit_card/custom_credit_card_widget.dart';

enum PaymentType { card, cash, paypal }

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key, required this.addressDocumentId});

  final String addressDocumentId;

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  PaymentType _type = PaymentType.card;
  final PageController _pageController = PageController(viewportFraction: 0.92);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentMethodsBloc>().add(const PaymentMethodsEvent.fetch());
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectCard(PaymentMethodsState state, int index) {
    if (state.cards.isEmpty) return;
    final i = index.clamp(0, state.cards.length - 1);
    final card = state.cards[i];
    setState(() => _type = PaymentType.card);
    context.read<PaymentMethodsBloc>().add(PaymentMethodsEvent.select(card.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutPaymentBloc, CheckoutPaymentState>(
      listenWhen: (p, c) => p.success != c.success || p.error != c.error,
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }

        if (state.success) {
          // Якщо хочеш — тут краще перейти в TrackOrder конкретного orderId
          // а не просто AppRoutes.trackOrder.
          context.go(AppRoutes.trackOrder);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,
          title: Text(
            'Checkout',
            style: TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontWeight: AppFonts.w600semiBold,
              fontSize: 22,
              color: AppColors.dark,
            ),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(Assets.icons.icBack.path),
          ),
        ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: BlocBuilder<CheckoutPaymentBloc, CheckoutPaymentState>(
              builder: (context, payState) {
                return BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                  builder: (context, pmState) {
                    return CustomButtonsWidget(
                      label:
                          payState.loading ? 'PROCESSING...' : 'MAKE PAYMENT',
                      enable: !payState.loading,
                      onPressed:
                          payState.loading
                              ? null
                              : () => _onPayPressed(context, pmState),
                    );
                  },
                );
              },
            ),
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [
              const CustomCheckoutWidget(
                checkoutDelivery: 2,
                checkoutAddress: 2,
                checkoutPayment: 1,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

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

                      BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                        builder: (context, state) {
                          if (state.loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state.cards.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'No saved cards yet',
                                style: TextStyle(color: AppColors.softGray),
                              ),
                            );
                          }

                          final selectedId =
                              state.selectedId ?? state.cards.first.id;

                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: state.cards.length,
                                  onPageChanged: (i) => _selectCard(state, i),
                                  itemBuilder: (context, index) {
                                    final c = state.cards[index];
                                    final selected = selectedId == c.id;

                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: GestureDetector(
                                        onTap: () => _selectCard(state, index),
                                        child: CustomCreditCardWidget(
                                          brand: c.brand,
                                          last4: c.last4,
                                          expMonth: c.expMonth,
                                          expYear: c.expYear,
                                          isDefault: c.isDefault,
                                          isSelected: selected,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: state.cards.length,
                                effect: WormEffect(
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: AppColors.orange,
                                  dotColor: AppColors.softGray.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      _paymentTile(
                        title: 'Cash Payment',
                        icon: Assets.icons.cashonIcon.path,
                        selected: _type == PaymentType.cash,
                        onTap: () => setState(() => _type = PaymentType.cash),
                      ),

                      const SizedBox(height: 16),

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
            ],
          ),
        ),
      ),
    );
  }

  void _onPayPressed(BuildContext context, PaymentMethodsState pmState) {
    if (_type == PaymentType.cash) {
      context.go(AppRoutes.trackOrder);
      return;
    }

    if (widget.addressDocumentId.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Missing addressDocumentId')),
      );
      return;
    }

    final selectedId =
        pmState.selectedId ??
        (pmState.cards.isNotEmpty ? pmState.cards.first.id : null);

    if (selectedId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select a card')));
      return;
    }

    final card = pmState.cards.firstWhere((c) => c.id == selectedId);

    final cartState = context.read<CartBloc>().state;
    final total = cartState.maybeWhen(
      success: (_, total) => total,
      orElse: () => 0.0,
    );

    final amountCents = (total * 100).round();
    if (amountCents <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cart total is 0')));
      return;
    }

    context.read<CheckoutPaymentBloc>().add(
      CheckoutPaymentEvent.pay(
        selectedCard: card,
        amount: amountCents,
        currency: 'usd',
        orderId: null,
        addressDocumentId: widget.addressDocumentId, // ✅ ОЦЕ ГОЛОВНЕ
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
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.orange : Colors.transparent,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 14),
                Text(title),
              ],
            ),
            CustomCircleCheckBoxWidget(isSelected: selected, onPressed: onTap),
          ],
        ),
      ),
    );
  }
}
