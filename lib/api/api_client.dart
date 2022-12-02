import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/cast_model.dart';
import 'package:movieapp/models/movie_detail_model.dart';
import 'api_constants.dart';
import 'package:movieapp/models/movie_model.dart';

//This class is used to import all the data that is required for the app.
//This class consists of different methods to get different kind of data.
class ApiClient extends GetxController {
  //This method gets all the trending movies and returns a list of them.
  Future<List<MovieModel>> getTrendingMovies() async {
    String uri =
        '${ApiConstants.baseUrl}trending/movie/week?${ApiConstants.apiKEY}';

    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['results'];

      List<MovieModel> movies = [];
      for (var movie in result) {
        movies.add(MovieModel.fromJson(movie));
      }

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets all the toprated movies and returns a list of them.
  Future<List<MovieModel>> getTopratedMovies() async {
    String uri =
        '${ApiConstants.baseUrl}movie/top_rated?${ApiConstants.apiKEY}&language=en-US&page=1';

    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['results'];

      List<MovieModel> movies = [];
      for (var movie in result) {
        movies.add(MovieModel.fromJson(movie));
      }

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets all the popular movies and returns a list of them.
  Future<List<MovieModel>> getPopularMovies() async {
    String uri =
        '${ApiConstants.baseUrl}movie/popular?${ApiConstants.apiKEY}&language=en-US&page=1';
    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['results'];

      List<MovieModel> movies = [];
      for (var movie in result) {
        movies.add(MovieModel.fromJson(movie));
      }

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets all the upcoming movies and returns a list of them.
  Future<List<MovieModel>> getUpcomingMovies() async {
    String uri =
        '${ApiConstants.baseUrl}movie/upcoming?${ApiConstants.apiKEY}&language=en-US&page=1';
    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['results'];

      List<MovieModel> movies = [];
      for (var movie in result) {
        movies.add(MovieModel.fromJson(movie));
      }
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets all the similar movies and returns a list of them.
  //To fetch the similar movies this function requires the movieId.
  Future<List<MovieModel>> getSimilarMovies(String movieId) async {
    String uri =
        '${ApiConstants.baseUrl}movie/$movieId/similar?${ApiConstants.apiKEY}&language=en-US&page=1';

    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['results'];
      // print(result);

      List<MovieModel> movies = [];
      for (var movie in result) {
        movies.add(MovieModel.fromJson(movie));
      }
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets the details of the movies.
  //To fetch the details of the movies this function requires the movieId.
  Future<MovieDetailModel> getMovieDetails(String movieId) async {
    String uri =
        '${ApiConstants.baseUrl}movie/$movieId?${ApiConstants.apiKEY}&language=en-US';

    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);

      MovieDetailModel details = MovieDetailModel.fromJson(data);

      return details;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets all the cast of the movies and returns a list of them.
  //To fetch the cast of the movies this function requires the movieId.
  Future<List<CastModel>> getMovieCast(String movieId) async {
    String uri =
        '${ApiConstants.baseUrl}movie/$movieId/credits?${ApiConstants.apiKEY}&language=en-US';
    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var result = data['cast'];

      List<CastModel> movieCast = [];
      for (var cast in result) {
        movieCast.add(CastModel.fromJson(cast));
      }
      return movieCast;
    } catch (e) {
      rethrow;
    }
  }

  //This method gets the searched movies and returns a list of them.
  //To fetch the searched movies this function requires the query ie. name of the movie.
  Future<List<MovieModel>> getSearchedMovies(String movieName) async {
    String uri =
        '${ApiConstants.baseUrl}search/movie?${ApiConstants.apiKEY}&language=en-US&page=1&include_adult=false&query=$movieName';
    try {
      http.Response response = await http.get(Uri.parse(uri));
      final data = json.decode(response.body);
      var results = data['results'];

      List<MovieModel> searchMovie = [];
      for (var movie in results) {
        searchMovie.add(MovieModel.fromJson(movie));
      }
      return searchMovie;
    } catch (e) {
      rethrow;
    }
  }
}
