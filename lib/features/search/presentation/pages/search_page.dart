import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/common/widgets/text_field_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/search/presentation/bloc/search_page_bloc.dart';
import 'package:movie_app/features/search/presentation/widgets/loading_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/movies_grid_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/no_results_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Results> searchResult = [];

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
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
            _buildTextFieldWidget(nameController, context),
            BlocConsumer<SearchPageBloc, SearchPageState>(
              listener: (context, state) {
                if (state is SearchSuccessState) {
                  searchResult = state.movies.results;
                }
              },
              buildWhen: (previous, current) => _buildWhen(current),
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  if (searchResult.isEmpty) {
                    return _buildNoResultsFoundWidget(
                      context,
                      AppLocalizations.of(context)?.noResults,
                    );
                  } else {
                    return MoviesGridWidget(movies: searchResult);
                  }
                } else if (state is LoadingState) {
                  return const LoadingWidget();
                } else {
                  return _buildNoResultsFoundWidget(
                    context,
                    AppLocalizations.of(context)?.searchYourFavoriteMovies,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  NoResultsWidget _buildNoResultsFoundWidget(
    BuildContext context,
    String? description,
  ) {
    return NoResultsWidget(
      description: AppLocalizations.of(context)?.searchYourFavoriteMovies ?? "",
    );
  }

  TextFieldWidget _buildTextFieldWidget(
    TextEditingController nameController,
    BuildContext context,
  ) {
    return TextFieldWidget(
      nameController: nameController,
      onChange: (value) {
        context.read<SearchPageBloc>().add(
              InitiateSearchEvent(
                keyWord: value,
              ),
            );
      },
    );
  }

  bool _buildWhen(SearchPageState current) {
    return current is SearchSuccessState ||
        current is FailureState ||
        current is LoadingState;
  }
}
