import 'package:dartz/dartz.dart';
import 'package:desafio/src/domain/repostories/movie_repository.dart';
import 'package:desafio/src/errors/failure.dart';

import '../entities/movie.dart';

abstract class GetMovieById {
  Future<Either<Failure, Movie>> call(int id);
}

class GetMovieByIdUseCase implements GetMovieById {
  MovieRepository repository;
  GetMovieByIdUseCase(this.repository);

  @override
  Future<Either<Failure, Movie>> call(int id) async {
    return await repository.getMovieById(id);
  }
}
