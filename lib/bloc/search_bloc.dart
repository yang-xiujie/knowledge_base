import 'dart:async';

class SearchBloc{
  StreamController<String> _searchController = StreamController<String>.broadcast();
  Sink<String> get searchChanged =>_searchController.sink;
  Stream<String> get search=>_searchController.stream;

  void dispose(){
    _searchController.close();
  }

}