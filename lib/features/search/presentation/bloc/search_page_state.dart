part of 'search_page_bloc.dart';

@immutable
sealed class SearchPageState {}

final class SearchPageInitial extends SearchPageState {}

final class SearchSuccessState extends SearchPageState {
  final Movie movies;

  SearchSuccessState({
    required this.movies,
  });
}

final class LoadingState extends SearchPageState {}

final class FailureState extends SearchPageState {}
