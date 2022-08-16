import 'dart:developer';

import 'package:desafio/src/domain/usecases/get_movie_by_id.dart';
import 'package:desafio/src/domain/usecases/get_similar_movies.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/movie.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  GetMovieById getMovieById;
  GetSimilarMovies getSimilarMovies;
  _HomeStoreBase(this.getMovieById, this.getSimilarMovies);

  @observable
  Movie movie = Movie(name: '', imageUrl: '', popularity: 0, voteCount: 0);

  @observable
  bool isFavorite = false;

  @observable
  ObservableList<Movie> similarMovies = ObservableList();

  @action
  Future fetchMovieById(int id) async {
    try {
      final response = await getMovieById(id);
      response.fold((l) => 'Erro ao retorna o filme', (r) {
        movie = Movie(
            imageUrl: r.imageUrl,
            name: r.name,
            popularity: r.popularity,
            voteCount: r.voteCount);
      });
    } catch (e) {
      log('Erro no fold by Id: $e');
    }
  }

  @action
  Future fetchSimilarMovies(int id, int page) async {
    try {
      final response = await getSimilarMovies(id, page);
      response.fold((l) => 'Erro ao retornar lista de filmes similares', (r) {
        similarMovies.addAll(r);
      });
    } catch (e) {
      log('Erro no fold similarMovies: $e');
    }
  }
}
