import 'package:dartz/dartz.dart';
import 'package:desafio/src/domain/entities/movie.dart';
import 'package:desafio/src/domain/repostories/movie_repository.dart';
import 'package:desafio/src/errors/failure.dart';

abstract class GetSimilarMovies {
  Future<Either<Failure, List<Movie>>> call(int id, int page);
}

class GetSimilarMoviesUseCase implements GetSimilarMovies {
  MovieRepository repository;

  GetSimilarMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int id, int page) {
    return repository.getSimiliarMovies(id, page);
  }
}
