import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/widgets/app_bar_widget.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';
import 'package:movie_app/core/common/widgets/text_field_widget.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/data/dummy_data.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/features/home/domain/entities/results.dart';
import 'package:movie_app/features/search/presentation/bloc/search_page_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Results> searchResult = DummyData.dummyResults;

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
            TextFieldWidget(
              nameController: nameController,
              onChange: (value) {
                context.read<SearchPageBloc>().add(
                      InitiateSearchEvent(
                        keyWord: value,
                      ),
                    );
              },
            ),
            BlocConsumer<SearchPageBloc, SearchPageState>(
              listener: (context, state) {
                if (state is SearchSuccessState) {
                  searchResult = state.movies.results;
                }
              },
              buildWhen: (previous, current) => _buildWhen(current),
              builder: (context, state) {
                return Center(
                  child: Text(
                    "No results found.\nSearch for your favorite movies or shows here!",
                    textAlign: TextAlign.center,
                    style: appTextTheme.titleMedium?.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                      color: const Color.fromRGBO(255, 255, 255, 0.83),
                      fontSize: AppDimensions.size16,
                      height: 1.4,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _buildWhen(SearchPageState current) {
    return current is SearchSuccessState ||
        current is FailureState ||
        current is LoadingState;
  }
}
