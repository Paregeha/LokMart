import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

import '../../features/payments/blocs/add_card_bloc.dart';
import '../../features/payments/data/payments_repository.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  final _nameCtrl = TextEditingController();
  bool _cardComplete = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  TextStyle _labelStyle() => TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontWeight: AppFonts.w500medium,
    fontSize: 16.0,
    height: 1,
    letterSpacing: 0,
    color: AppColors.dark,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCardBloc(context.read<PaymentsRepository>()),
      child: BlocListener<AddCardBloc, AddCardState>(
        listener: (context, state) {
          if (state.error != null && state.error!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                behavior: SnackBarBehavior.fixed,
              ),
            );
          }
          if (state.success) {
            context.pop();
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
                fontSize: 22.0,
                height: 1,
                letterSpacing: -0.3,
                color: AppColors.dark,
              ),
            ),
            centerTitle: false,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Assets.icons.icBack.svg(width: 24.0, height: 24.0),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: BlocBuilder<AddCardBloc, AddCardState>(
                builder: (context, state) {
                  final enable =
                      !state.loading &&
                      _cardComplete &&
                      _nameCtrl.text.trim().isNotEmpty;

                  return CustomButtonsWidget(
                    label: state.loading ? 'ADDING...' : 'ADD CARD',
                    enable: enable,
                    onPressed:
                        enable
                            ? () {
                              context.read<AddCardBloc>().add(
                                AddCardEvent.submit(
                                  cardholderName: _nameCtrl.text,
                                ),
                              );
                            }
                            : null,
                  );
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    Text('Card Holder Name', style: _labelStyle()),
                    const SizedBox(height: 11.0),
                    TextField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(
                        hintText: 'Enter your full name',
                        filled: true,
                        fillColor: AppColors.gray1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),

                    const SizedBox(height: 24.0),

                    Text('Card Details', style: _labelStyle()),
                    const SizedBox(height: 11.0),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gray1,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: CardField(
                        onCardChanged: (card) {
                          setState(
                            () => _cardComplete = card?.complete ?? false,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text(
                      'We do not store your card number. Stripe securely saves it.',
                      style: TextStyle(color: AppColors.softGray),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
