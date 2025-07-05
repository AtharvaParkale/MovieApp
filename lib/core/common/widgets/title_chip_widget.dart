import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class TitleChipWidget extends StatelessWidget {
  const TitleChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 3, // thickness
            height: 18,
            decoration: BoxDecoration(
              color: AppPallete.secondaryColor,
              borderRadius: BorderRadius.circular(10), // 👈 makes it rounded
            ),
          ),
          const SizedBox(width: 5),
          Text(
            AppLocalizations.of(context)?.trendingMovies ?? "",
            style: appTextTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.semiBold,
              color: AppPallete.whiteColor,
              height: 1.2,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
