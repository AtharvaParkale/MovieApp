import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              size: 72,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: AppDimensions.size20),
            Text(
              description ,
              textAlign: TextAlign.center,
              style: appTextTheme.titleMedium?.copyWith(
                fontWeight: AppFontWeight.semiBold,
                color: const Color.fromRGBO(255, 255, 255, 0.7),
                fontSize: AppDimensions.size16,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
