import 'dart:async';
import 'package:knowledge_base/services/fetch_api.dart';
import 'package:knowledge_base/models/knowledge.dart';

class HomeBloc{
  final FetchApi fetchApi;
  final StreamController<List<Knowledge_txt>> _knowledgeController = StreamController<List<Knowledge_txt>>.broadcast();
  Sink<List<Knowledge_txt>> get _knowledgeListChange => _knowledgeController.sink;
  Stream<List<Knowledge_txt>> get listKnowledge => _knowledgeController.stream;
  final StreamController<Knowledge_txt> _deleteController = StreamController<Knowledge_txt>.broadcast();
  Sink<Knowledge_txt> get deleteKnowledge => _deleteController.sink;
  HomeBloc(this.fetchApi){
    _startListener();
  }
  void dispose(){
    _knowledgeController.close();
    _deleteController.close();
  }
  void _startListener(){
    fetchApi.getAllKnowledge().listen((knowledgeList){
      _knowledgeListChange.add(knowledgeList);
    });
    _deleteController.stream.listen((knowledge){
      fetchApi.deleteKnowledge(knowledge);
    });
  }

}