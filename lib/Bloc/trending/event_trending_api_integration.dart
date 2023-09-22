part of 'trending_api_integration_bloc.dart';

@immutable
sealed class TrendingWallpaperEvent {}

class GetSearchWallpaper extends TrendingWallpaperEvent {
  String query;
  GetSearchWallpaper({required this.query});
}

class GetTrendingWallpaper extends TrendingWallpaperEvent {}
