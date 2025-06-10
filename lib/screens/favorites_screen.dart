import 'package:flutter/material.dart';
import '../controllers/favorites_controller.dart';
import '../models/movie_model.dart';

class FavoritesScreen extends StatelessWidget {
  final controller = FavoritesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: ValueListenableBuilder<List<MovieModel>>(
        valueListenable: controller.favorites,
        builder: (context, favoriteMovies, _) {
          if (favoriteMovies.isEmpty) {
            return Center(child: Text('Nenhum favorito ainda'));
          }

          return ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return ListTile(
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.pushNamed(context, '/movie_details', arguments: movie);
                },
              );
            },
          );
        },
      ),
    );
  }
}
