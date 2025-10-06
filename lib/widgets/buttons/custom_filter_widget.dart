import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key, this.onPressed});

  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.gray1),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.icFilter,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
