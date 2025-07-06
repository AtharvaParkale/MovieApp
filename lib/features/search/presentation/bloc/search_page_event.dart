part of 'search_page_bloc.dart';

@immutable
sealed class SearchPageEvent {}

final class InitiateSearchEvent extends SearchPageEvent {
  final String keyWord;

  InitiateSearchEvent({
    required this.keyWord,
  });
}
