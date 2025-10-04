import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class CustomButtonCountWidget extends StatefulWidget {
  const CustomButtonCountWidget({
    super.key,
    required this.heightCount,
    required this.widthCount,
  });

  final double heightCount;
  final double widthCount;

  @override
  State<CustomButtonCountWidget> createState() =>
      _CustomButtonCountWidgetState();
}

class _CustomButtonCountWidgetState extends State<CustomButtonCountWidget> {
  late int count = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          color: Colors.transparent,
          width: widget.widthCount,
          height: widget.heightCount,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Ink(
                width: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey1),
                ),
                // height: double.infinity,
                child: Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      setState(() {
                        if (count > 1) count--;
                      });
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.icons.minus,
                        width: 10.0,
                        height: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Center(child: Text('$count'))),
              Ink(
                width: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey1),
                ),
                // height: double.infinity,
                child: Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.icons.pluss,
                        width: 10.0,
                        height: 10.0,
                        colorFilter: ColorFilter.mode(
                          AppColors.dark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
