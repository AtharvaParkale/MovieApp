import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/constants/image_path.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: AppPallete.primaryColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.size24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              ImagePath.appLogo,
              height: AppDimensions.size28,
              width: AppDimensions.size28,
            ),
            const SizedBox(
              width: AppDimensions.size8,
            ),
            Text(
              AppLocalizations.of(context)?.appTitle ?? "",
              style: appTextTheme.titleSmall?.copyWith(
                fontWeight: AppFontWeight.bold,
                color: AppPallete.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
