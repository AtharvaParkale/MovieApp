import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.size28,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.size20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search movies,series, ...',
                hintStyle: appTextTheme.bodyMedium?.copyWith(
                  fontWeight: AppFontWeight.medium,
                  color: AppPallete.lightDescriptionColor,
                  height: 1.5,
                  fontSize: 12,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppPallete.lightDescriptionColor,
                ),
                filled: true,
                fillColor: AppPallete.titleColor,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              cursorColor: AppPallete.secondaryColor,
              style: appTextTheme.bodyMedium?.copyWith(
                fontWeight: AppFontWeight.medium,
                color: AppPallete.lightDescriptionColor,
                height: 1.5,
                fontSize: 12,
              ),
            ),
            const Text(
              'Search page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
