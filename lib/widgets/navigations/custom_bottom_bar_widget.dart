import 'package:flutter/material.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 88.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(children: []),
      ),
    );
  }
}
