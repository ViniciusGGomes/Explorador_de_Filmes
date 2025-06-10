import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/watchlist_controller.dart';

class MovieDetailsScreen extends StatelessWidget {
  final favoritesController = FavoritesController();

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.posterPath != null)
              Center(
                child: Image.network(movie.fullPosterPath, height: 400),
              ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Data de lançamento: ${movie.releaseDate}',
                style: TextStyle(color: Colors.grey[400])),
            const SizedBox(height: 8),
            Text('Nota média: ${movie.voteAverage}',
                style: TextStyle(
                    color: Colors.amberAccent, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Text(movie.overview, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    favoritesController.toggleFavorite(movie);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          favoritesController.isFavorite(movie)
                              ? 'Adicionado aos favoritos'
                              : 'Removido dos favoritos',
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    favoritesController.isFavorite(movie)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  label: Text('Favorito'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    WatchlistController.add(movie);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Adicionado à Watchlist')),
                    );
                  },
                  icon: const Icon(Icons.bookmark_border),
                  label: const Text('Watchlist'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
