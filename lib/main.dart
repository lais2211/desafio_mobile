import 'package:desafio/src/app_widget.dart';
import 'package:desafio/src/domain/repostories/movie_repository.dart';
import 'package:desafio/src/domain/usecases/get_movie_by_id.dart';
import 'package:desafio/src/domain/usecases/get_similar_movies.dart';
import 'package:desafio/src/external/datasources/movie_datasource_impl.dart';
import 'package:desafio/src/infra/datasources/movie_datasource.dart';
import 'package:desafio/src/infra/repositories/movie_repository_impl.dart';
import 'package:desafio/src/views/home/stores/home_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  configApp();
  runApp(const AppWidget());
}

void configApp() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<Dio>(configDio());
  getIt.registerSingleton<MovieDatasource>(MovieDatasourceImpl(GetIt.I()));
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(GetIt.I()));
  getIt.registerSingleton<GetMovieById>(GetMovieByIdUseCase(GetIt.I()));
  getIt.registerSingleton<GetSimilarMovies>(GetSimilarMoviesUseCase(GetIt.I()));

  getIt.registerSingleton<HomeStore>(HomeStore(GetIt.I(), GetIt.I()));
}

Dio configDio() {
  Dio dio = Dio();

  dio.options.queryParameters = {'apiKey': 'd3658a5e2b9b0484f233be9d70f0aeeb'};

  return dio;
}
