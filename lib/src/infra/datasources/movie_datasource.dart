import '../models/movie_model.dart';

abstract class MovieDatasource {
  Future<MovieModel> getMovieById(int id);
  Future<List<MovieModel>> getSimilarMovies(int id, int page);
}
