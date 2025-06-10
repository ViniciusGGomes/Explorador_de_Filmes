import '../models/movie_model.dart';

class WatchlistController {
  static final List<MovieModel> _watchlist = [];

  static void add(MovieModel movie) {
    if (!_watchlist.any((m) => m.id == movie.id)) {
      _watchlist.add(movie);
    }
  }

  static void remove(MovieModel movie) {
    _watchlist.removeWhere((m) => m.id == movie.id);
  }

  static List<MovieModel> get items => List.unmodifiable(_watchlist);
}
