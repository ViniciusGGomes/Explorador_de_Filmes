import 'package:flutter/material.dart';
import '../controllers/watchlist_controller.dart';
import '../models/movie_model.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watchlist = WatchlistController.items;

    return Scaffold(
      appBar: AppBar(title: Text('Minha Watchlist')),
      body: watchlist.isEmpty
          ? Center(child: Text('Nenhum filme na watchlist'))
          : ListView.builder(
        itemCount: watchlist.length,
        itemBuilder: (context, index) {
          final movie = watchlist[index];
          return ListTile(
            leading: movie.posterPath != null
                ? Image.network(movie.fullPosterPath, width: 50)
                : null,
            title: Text(movie.title),
            subtitle: Text(movie.releaseDate ?? 'Data desconhecida'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                WatchlistController.remove(movie);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Removido da Watchlist')));
                // Recomenda-se usar StatefulWidget aqui caso precise atualizar em tempo real
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/movie_details', arguments: movie);
            },
          );
        },
      ),
    );
  }
}
