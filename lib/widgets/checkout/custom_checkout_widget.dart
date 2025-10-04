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
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  width: 40.0,
                  height: 40.0,
                  child: Icon(Icons.check_rounded, color: AppColors.white),
                ),
                Expanded(
                  child: Container(height: 2.0, color: AppColors.orange),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  width: 40.0,
                  height: 40.0,
                  child: Icon(Icons.check_rounded, color: AppColors.white),
                ),
                Expanded(
                  child: Container(height: 2.0, color: AppColors.orange),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  width: 40.0,
                  height: 40.0,
                  child: Icon(Icons.check_rounded, color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
