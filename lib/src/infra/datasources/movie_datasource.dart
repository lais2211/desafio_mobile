import '../models/movie_model.dart';

abstract class MovieDatasource {
  Future<MovieModel> getMovieById(int id);
}
