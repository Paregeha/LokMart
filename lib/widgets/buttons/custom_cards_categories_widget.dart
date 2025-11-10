import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import '../../core/env.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_fonts.dart';

class CustomCardsCategoriesWidget extends StatelessWidget {
  const CustomCardsCategoriesWidget({
    super.key,
    this.onPressed,
    this.title,
    this.count,
    this.photoUrl,
  });

  final VoidCallback? onPressed;

  final String? title;
  final int? count;
  final String? photoUrl;

  String? _normalizedUrl(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    if (raw.startsWith('http')) return raw;
    return '${Env.baseUrl}$raw';
  }

  @override
  Widget build(BuildContext context) {
    final url = _normalizedUrl(photoUrl);

    return Ink(
      height: 120.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: AppColors.gray1, width: 1.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14.0),
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (url != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  top: 26.0,
                  bottom: 26.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    url,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (_, _, _) => Assets.images.icLemon.image(
                          width: 80.0,
                          height: 80.0,
                        ),
                  ),
                ),
              )
            else
              Assets.images.icLemon.image(width: 80.0, height: 80.0),

            const SizedBox(width: 17.0),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Fruits',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w600semiBold,
                    ),
                  ),
                  Text('${count ?? 0} items', overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
