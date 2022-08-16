part of 'home_store.dart';

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$movieAtom = Atom(name: '_HomeStoreBase.movie', context: context);

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_HomeStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$similarMoviesAtom =
      Atom(name: '_HomeStoreBase.similarMovies', context: context);

  @override
  ObservableList<Movie> get similarMovies {
    _$similarMoviesAtom.reportRead();
    return super.similarMovies;
  }

  @override
  set similarMovies(ObservableList<Movie> value) {
    _$similarMoviesAtom.reportWrite(value, super.similarMovies, () {
      super.similarMovies = value;
    });
  }

  late final _$fetchMovieByIdAsyncAction =
      AsyncAction('_HomeStoreBase.fetchMovieById', context: context);

  @override
  Future<dynamic> fetchMovieById(int id) {
    return _$fetchMovieByIdAsyncAction.run(() => super.fetchMovieById(id));
  }

  late final _$fetchSimilarMoviesAsyncAction =
      AsyncAction('_HomeStoreBase.fetchSimilarMovies', context: context);

  @override
  Future<dynamic> fetchSimilarMovies(int id, int page) {
    return _$fetchSimilarMoviesAsyncAction
        .run(() => super.fetchSimilarMovies(id, page));
  }

  @override
  String toString() {
    return '''
movie: ${movie},
isFavorite: ${isFavorite},
similarMovies: ${similarMovies}
''';
  }
}
