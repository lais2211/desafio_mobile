import 'package:desafio/src/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio/src/domain/repostories/movie_repository.dart';
import 'package:desafio/src/errors/failure.dart';

import '../datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  late MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Movie>> getMovieById(int id) async {
    try {
      final remoteDate = await datasource.getMovieById(id);
      return Right(remoteDate);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
