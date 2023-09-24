part of 'search_api_integration_bloc.dart';

@immutable
sealed class SearchApiEvent {}

class GetSearchWallpaper extends SearchApiEvent {
  String query;
  GetSearchWallpaper({required this.query});
}
