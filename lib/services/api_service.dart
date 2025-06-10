import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2M4Yzg1OGI4ZjFjNzZkNTk0NThkYjE0NjVmN2M0ZCIsIm5iZiI6MTc0OTU4NTgxNy4zNzYsInN1YiI6IjY4NDg4Zjk5MWY2MWQxNTk1NzNlMDZjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EfepYLzcAniFSD_QAD71IiT2xV3gFW56eHNqeXMIzDg';

  static Future<List<MovieModel>?> fetchNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/movie/now_playing?language=pt-BR&page=1'),
        headers: {
          'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json;charset=utf-8',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        final List movies = data['results'];
        return movies.map((e) => MovieModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
