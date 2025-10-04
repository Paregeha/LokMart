import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCheckoutWidget extends StatefulWidget {
  const CustomCheckoutWidget({
    super.key,
    this.checkoutDelivery = 0,
    this.checkoutAddress = 0,
    this.checkoutPayment = 0,
  });

  final int? checkoutDelivery;
  final int? checkoutAddress;
  final int? checkoutPayment;

  @override
  State<CustomCheckoutWidget> createState() => _CustomCheckoutWidgetState();
}

class _CustomCheckoutWidgetState extends State<CustomCheckoutWidget> {
  late int _delivery, _address, _payment;

  @override
  void initState() {
    super.initState();
    _delivery = widget.checkoutDelivery ?? 0;
    _address = widget.checkoutAddress ?? 0;
    _payment = widget.checkoutPayment ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_delivery < 2) {
                              _delivery++;
                              if (_delivery == 2) {
                                _address = 1;
                              }
                            }
                          });
                        },
                        child:
                            _delivery == 0
                                ? _EnableCheckout()
                                : _delivery == 1
                                ? _ProgressCheckout()
                                : _EndCheckout(),
                      ),
                      _LineCheckout(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _address = 2;
                            _payment = 1;
                          });
                        },
                        child:
                            _address == 0
                                ? _EnableCheckout()
                                : _address == 1
                                ? _ProgressCheckout()
                                : _EndCheckout(),
                      ),
                      _LineCheckout(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _payment = 2;
                          });
                        },
                        child:
                            _payment == 0
                                ? _EnableCheckout()
                                : _payment == 1
                                ? _ProgressCheckout()
                                : _EndCheckout(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 11.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery'),
                    Text('Address'),
                    Text('Payment'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EndCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(14.0),
      ),
      width: 40.0,
      height: 40.0,
      child: Icon(Icons.check_rounded, color: AppColors.white),
    );
  }
}

class _ProgressCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(width: 3.0, color: AppColors.orange),
      ),
      width: 40.0,
      height: 40.0,
      child: Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.orange,
          ),
        ),
      ),
    );
  }
}

class _EnableCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(14.0),
      ),
      width: 40.0,
      height: 40.0,
    );
  }
}

class _LineCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 2.0, color: AppColors.grey));
  }
}
