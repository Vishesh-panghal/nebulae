part of 'search_api_integration_bloc.dart';

@immutable
sealed class SearchApiEvent {}

class GetSearchWallpaper extends SearchApiEvent {
  String query;
  int pageNo;
  GetSearchWallpaper({required this.query, this.pageNo = 1});
}
