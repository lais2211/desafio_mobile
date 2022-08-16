import 'package:desafio/src/errors/failure.dart';
import 'package:desafio/src/infra/datasources/movie_datasource.dart';
import 'package:desafio/src/infra/models/movie_model.dart';
import 'package:dio/dio.dart';

class MovieDatasourceImpl implements MovieDatasource {
  Dio dio;
  MovieDatasourceImpl(this.dio);

  @override
  Future<MovieModel> getMovieById(int id) {
    return getAndParseMovie('movie/$id');
  }

  Future<MovieModel> getAndParseMovie(String path) async {
    final movieDetails = await dio.get(
        'https://api.themoviedb.org/3/movie/11544?api_key=d3658a5e2b9b0484f233be9d70f0aeeb');

    if (movieDetails.statusCode == 200) {
      return MovieModel.fromJson(movieDetails.data);
    } else {
      throw Failure();
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int id, int page) async {
    final similarMoviesListResponse = await dio.get(
        'https://api.themoviedb.org/3/movie/11544/similar?api_key=d3658a5e2b9b0484f233be9d70f0aeeb');
    if (similarMoviesListResponse.statusCode == 200) {
      final similarMovieList =
          similarMoviesListResponse.data['results'] as List;

      List<MovieModel> movieList = [];
      for (var movie in similarMovieList) {
        movieList.add(MovieModel.fromJson(movie));
      }
      return movieList;
    } else {
      throw Failure();
    }
  }
}
