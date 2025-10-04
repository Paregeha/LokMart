import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomCheckoutWidget extends StatefulWidget {
  const CustomCheckoutWidget({super.key});

  @override
  State<CustomCheckoutWidget> createState() => _CustomCheckoutWidgetState();
}

class _CustomCheckoutWidgetState extends State<CustomCheckoutWidget> {
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
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        width: 40.0,
                        height: 40.0,
                        child: Icon(
                          Icons.check_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(height: 2.0, color: AppColors.orange),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14.0),
                          border: Border.all(
                            width: 3.0,
                            color: AppColors.orange,
                          ),
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
                      ),
                      Expanded(
                        child: Container(height: 2.0, color: AppColors.grey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        width: 40.0,
                        height: 40.0,
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
