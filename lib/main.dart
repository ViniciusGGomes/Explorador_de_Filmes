import 'package:flutter/material.dart';
import 'screens/now_playing_screen.dart';
import 'screens/movie_details_screen.dart';
import 'screens/watchlist_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    title: 'Movie Explorer',
    initialRoute: '/',
    routes: {
      '/': (context) => NowPlayingScreen(),
      '/movie_details': (context) => MovieDetailsScreen(),
      '/watchlist': (context) => WatchlistScreen(),
      '/favorites': (context) => FavoritesScreen(),
      '/settings': (context) => SettingsScreen(),
    },
  ));
}
