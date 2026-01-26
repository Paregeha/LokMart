import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/checkout/custom_checkout_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../features/address/data/address_repository.dart';
import '../../features/address/models/address.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_fonts.dart';

class CheckoutAddressPage extends StatefulWidget {
  const CheckoutAddressPage({super.key});

  @override
  State<CheckoutAddressPage> createState() => _CheckoutAddressPageState();
}

class _CheckoutAddressPageState extends State<CheckoutAddressPage> {
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _zipCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _countryCtrl = TextEditingController();

  bool _saveAddress = true;

  bool _loadingPrefill = true;
  bool _saving = false;

  Address? _defaultAddress;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _prefillFromDefault());
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    _zipCtrl.dispose();
    _cityCtrl.dispose();
    _countryCtrl.dispose();
    super.dispose();
  }

  Future<void> _prefillFromDefault() async {
    setState(() => _loadingPrefill = true);
    try {
      final repo = context.read<AddressRepository>();
      final def = await repo.fetchDefault();
      _defaultAddress = def;

      if (def != null && mounted) {
        _fullNameCtrl.text = def.fullName;
        _emailCtrl.text = def.email;
        _phoneCtrl.text = def.phone;
        _addressCtrl.text = def.addressLine;
        _zipCtrl.text = def.zipCode;
        _cityCtrl.text = def.city;
        _countryCtrl.text = def.country;
      }
    } catch (_) {
      // ignore
    } finally {
      if (mounted) setState(() => _loadingPrefill = false);
    }
  }

  void _showError(String msg) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(msg), behavior: SnackBarBehavior.fixed),
      );
  }

  bool _validate() {
    if (_fullNameCtrl.text.trim().isEmpty) {
      _showError('Enter your full name');
      return false;
    }
    if (_emailCtrl.text.trim().isEmpty) {
      _showError('Enter your email address');
      return false;
    }
    if (_phoneCtrl.text.trim().isEmpty) {
      _showError('Enter your phone number');
      return false;
    }
    if (_addressCtrl.text.trim().isEmpty) {
      _showError('Enter your home address');
      return false;
    }
    if (_zipCtrl.text.trim().isEmpty) {
      _showError('Enter zip code');
      return false;
    }
    if (_cityCtrl.text.trim().isEmpty) {
      _showError('Enter city');
      return false;
    }
    if (_countryCtrl.text.trim().isEmpty) {
      _showError('Choose your country');
      return false;
    }
    return true;
  }

  Future<void> _onNext() async {
    if (!_validate()) return;

    if (!_saveAddress) {
      final docId = _defaultAddress?.documentId ?? '';
      if (docId.trim().isEmpty) {
        _showError(
          'No saved address found. Please enable "Save shipping address" once.',
        );
        return;
      }
      context.push(AppRoutes.checkoutPayment, extra: docId);
      return;
    }

    setState(() => _saving = true);
    try {
      final repo = context.read<AddressRepository>();

      final addr = Address(
        id: _defaultAddress?.id ?? 0,
        documentId: _defaultAddress?.documentId ?? '',
        fullName: _fullNameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        addressLine: _addressCtrl.text.trim(),
        zipCode: _zipCtrl.text.trim(),
        city: _cityCtrl.text.trim(),
        country: _countryCtrl.text.trim(),
        isDefault: true,
      );

      await repo.saveAsDefault(addr);

      final savedDefault = await repo.fetchDefault();
      final docId = savedDefault?.documentId ?? '';

      if (docId.trim().isEmpty) {
        _showError(
          'Address saved, but documentId is missing from API response.',
        );
        return;
      }

      context.push(AppRoutes.checkoutPayment, extra: docId);
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _saving = false);
    }
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
            CustomCheckoutWidget(checkoutDelivery: 2, checkoutAddress: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      if (_loadingPrefill) ...[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],

                      Text('Full Name', style: _labelStyle()),
                      const SizedBox(height: 10.0),
                      CustomTextFieldWidget(
                        controller: _fullNameCtrl,
                        hintText: 'Enter your full name',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      Text('Email Address', style: _labelStyle()),
                      const SizedBox(height: 10.0),
                      CustomTextFieldWidget(
                        controller: _emailCtrl,
                        hintText: 'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      Text('Phone Number', style: _labelStyle()),
                      const SizedBox(height: 10.0),
                      CustomTextFieldWidget(
                        controller: _phoneCtrl,
                        hintText: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      Text('Address', style: _labelStyle()),
                      const SizedBox(height: 10.0),
                      CustomTextFieldWidget(
                        controller: _addressCtrl,
                        hintText: 'Enter your home address',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Zip Code', style: _labelStyle()),
                                const SizedBox(height: 10.0),
                                CustomTextFieldWidget(
                                  controller: _zipCtrl,
                                  hintText: 'Zip Code',
                                  keyboardType: TextInputType.number,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('City', style: _labelStyle()),
                                const SizedBox(height: 10.0),
                                CustomTextFieldWidget(
                                  controller: _cityCtrl,
                                  hintText: 'City',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24.0),

                      Text('Country', style: _labelStyle()),
                      const SizedBox(height: 10.0),
                      CustomTextFieldWidget(
                        controller: _countryCtrl,
                        hintText: 'Choose your country',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),

                      const SizedBox(height: 24.0),

                      Row(
                        children: [
                          CustomCheckBoxWidget(
                            isSelected: _saveAddress,
                            onPressed: () {
                              setState(() => _saveAddress = !_saveAddress);
                            },
                          ),
                          const SizedBox(width: 16.0),
                          Text('Save shipping address', style: _labelStyle()),
                        ],
                      ),

                      const SizedBox(height: 30.0),

                      CustomButtonsWidget(
                        label: _saving ? 'SAVING...' : 'NEXT',
                        enable: !_saving,
                        onPressed: _saving ? null : _onNext,
                      ),

                      const SizedBox(height: 24.0),
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
}
