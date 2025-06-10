import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class FavoritesController {
  static final FavoritesController _instance = FavoritesController._internal();
  factory FavoritesController() => _instance;
  FavoritesController._internal();

  final ValueNotifier<List<MovieModel>> favorites = ValueNotifier([]);

  void toggleFavorite(MovieModel movie) {
    if (favorites.value.contains(movie)) {
      favorites.value = List.from(favorites.value)..remove(movie);
    } else {
      favorites.value = List.from(favorites.value)..add(movie);
    }
  }

  bool isFavorite(MovieModel movie) {
    return favorites.value.contains(movie);
  }
}

