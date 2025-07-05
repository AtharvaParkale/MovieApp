import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/constants/image_path.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetPopularMoviesEvent());

  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: AppPallete.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          // Ensures content takes only needed space
          children: [
            SvgPicture.asset(
              ImagePath.appLogo,
              height: 28,
              width: 28,
            ),
            const SizedBox(width: 8),
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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is PopularMoviesFetchedState) {
            print('Demo :: ${state.popularMovies.results.length}');
          }
        },
        builder: (context, state) {
          return Text(
            AppLocalizations.of(context)?.appTitle ?? "",
            style: appTextTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.medium,
              color: AppPallete.whiteColor,
            ),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
