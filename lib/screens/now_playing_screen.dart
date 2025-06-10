import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie_model.dart';

class NowPlayingScreen extends StatefulWidget {
  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  int mainScreenState = 2;
  List<MovieModel> allMovies = [];
  List<MovieModel> filteredMovies = [];
  final TextEditingController searchController = TextEditingController();

  void tryAgain() {
    setState(() => mainScreenState = 2);
    loadData();
  }

  Future<void> loadData() async {
    final response = await ApiService.fetchNowPlayingMovies();

    if (response == null) {
      setState(() => mainScreenState = 1);
    } else {
      setState(() {
        allMovies = response;
        filteredMovies = response;
        mainScreenState = 0;
      });
    }
  }

  void filterMovies(String query) {
    final filtered = allMovies
        .where((movie) =>
        movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() => filteredMovies = filtered);
  }

  @override
  void initState() {
    super.initState();
    loadData();
    searchController.addListener(() {
      filterMovies(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mainScreenState == 2) return loadingScreen();
    if (mainScreenState == 1) return errorScreen();
    return successScreen();
  }

  Widget loadingScreen() {
    return Scaffold(
      appBar: AppBar(title: Text('Carregando...')),
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Widget errorScreen() {
    return Scaffold(
      appBar: AppBar(title: Text('Erro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Erro ao carregar dados'),
            SizedBox(height: 16),
            ElevatedButton(onPressed: tryAgain, child: Text('Tentar novamente')),
          ],
        ),
      ),
    );
  }

  Widget successScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes em Cartaz'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar filmes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white10,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      // ... código anterior mantido

      drawer: Drawer(
        child: Container(
          color: Colors.grey[900],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[850]),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.white),
                title: Text('Favoritos', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/favorites'),
              ),
              ListTile(
                leading: Icon(Icons.bookmark, color: Colors.white), // Ícone da Watchlist
                title: Text('Watchlist', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/watchlist'),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Configurações', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),

      body: filteredMovies.isEmpty
          ? Center(child: Text('Nenhum filme encontrado.'))
          : ListView.builder(
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = filteredMovies[index];
          return ListTile(
            leading: movie.posterPath != null
                ? Image.network(movie.fullPosterPath, width: 50, fit: BoxFit.cover)
                : null,
            title: Text(movie.title),
            subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
            onTap: () {
              Navigator.pushNamed(context, '/movie_details', arguments: movie);
            },
          );
        },
      ),
    );
  }
}


