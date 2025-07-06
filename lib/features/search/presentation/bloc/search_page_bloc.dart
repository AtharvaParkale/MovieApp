import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/search/domain/usecases/search_movies.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final SearchMovies _searchMovies;

  SearchPageBloc({
    required SearchMovies searchMovies,
  })  : _searchMovies = searchMovies,
        super(SearchPageInitial()) {
    on<SearchPageEvent>((event, emit) {});
    on<InitiateSearchEvent>(_handleInitiateSearchEvent);
  }

  Future<void> _handleInitiateSearchEvent(
    InitiateSearchEvent event,
    Emitter<SearchPageState> emit,
  ) async {
    emit(LoadingState());
    final res = await _searchMovies(event.keyWord);
    res.fold(
      (l) => emit(FailureState()),
      (r) => emit(SearchSuccessState(movies: r)),
    );
  }
}
