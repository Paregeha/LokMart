import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import '../../gen/assets.gen.dart';

class CustomBottomBarWidget extends StatefulWidget {
  const CustomBottomBarWidget({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  final int activeIndex; // 0..4
  final ValueChanged<int> onTap;
  @override
  State<CustomBottomBarWidget> createState() => _CustomBottomBarWidgetState();
}

class _CustomBottomBarWidgetState extends State<CustomBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          width: double.infinity,
          height: 88.0,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.gray1, offset: Offset(0, -0.5)),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 41.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavItem(
                  isActive: widget.activeIndex == 0,
                  onTap: () {
                    setState(() {
                      widget.onTap(0);
                    });
                  },
                  icon: SvgPicture.asset(
                    Assets.icons.icHome,
                    width: 24,
                    height: 24,
                  ),
                ),
                _NavItem(
                  isActive: widget.activeIndex == 1,
                  onTap: () {
                    setState(() {
                      widget.onTap(1);
                    });
                  },
                  icon: SvgPicture.asset(
                    Assets.icons.icMyorder,
                    width: 24,
                    height: 24,
                  ),
                ),
                _NavItem(
                  isActive: widget.activeIndex == 2,
                  onTap: () {
                    setState(() {
                      widget.onTap(2);
                    });
                  },
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [AppColors.gradientOne, AppColors.gradientTwo],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(child: SvgPicture.asset(Assets.icons.buy)),
                  ),
                ),
                _NavItem(
                  isActive: widget.activeIndex == 3,
                  onTap: () {
                    setState(() {
                      widget.onTap(3);
                    });
                  },
                  icon: SvgPicture.asset(
                    Assets.icons.icWishlist,
                    width: 24,
                    height: 24,
                  ),
                ),
                _NavItem(
                  isActive: widget.activeIndex == 4,
                  onTap: () {
                    setState(() {
                      widget.onTap(4);
                    });
                  },
                  icon: SvgPicture.asset(
                    Assets.icons.icProfile,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final Widget icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 180),
            opacity: isActive ? 1 : 0,
            child: Container(
              width: 16,
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFFC7A33), // або AppColors.orange
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(1.0),
                  bottomLeft: Radius.circular(1.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
