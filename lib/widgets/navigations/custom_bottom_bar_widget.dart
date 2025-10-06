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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(
              isActive: widget.activeIndex == 0,
              onTap: () {
                widget.onTap(0);
              },
              icon: SvgPicture.asset(
                widget.activeIndex == 0
                    ? Assets.icons.home
                    : Assets.icons.icHome,
                width: 24,
                height: 24,
              ),
            ),
            _NavItem(
              isActive: widget.activeIndex == 1,
              onTap: () {
                widget.onTap(1);
              },
              icon: SvgPicture.asset(
                widget.activeIndex == 1
                    ? Assets.icons.icMyorderActive
                    : Assets.icons.icMyorder,
                width: 24,
                height: 24,
              ),
            ),
            _NavItem(
              isActive: widget.activeIndex == 2,
              onTap: () {
                widget.onTap(2);
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
                widget.onTap(3);
              },
              icon: SvgPicture.asset(
                widget.activeIndex == 3
                    ? Assets.icons.icWishlistActive
                    : Assets.icons.icWishlist,
                width: 24,
                height: 24,
              ),
            ),
            _NavItem(
              isActive: widget.activeIndex == 4,
              onTap: () {
                widget.onTap(4);
              },
              icon: SvgPicture.asset(
                widget.activeIndex == 4
                    ? Assets.icons.icProfileActive
                    : Assets.icons.icProfile,
                width: 24,
                height: 24,
              ),
            ),
          ],
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
      child: SizedBox(
        width: 39,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            icon,

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: isActive ? 1 : 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 16,
                      height: 2,

                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
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
