import 'dart:async';
import 'dart:convert';
import 'package:knowledge_base/services/fetch_api.dart';
import 'package:knowledge_base/models/knowledge.dart';
class KnowledgeBloc{
 final FetchApi fetchApi;
 final bool add;
 Knowledge_txt knowledge;
 KnowledgeBloc(this.fetchApi,this.add,this.knowledge){
  _startEditListeners().then((finished)=>_getKnowledge(add,knowledge));
 }
 final StreamController<String> _titleController =StreamController<String>.broadcast();
 Sink<String> get titleChange=> _titleController.sink;
 Stream<String> get title => _titleController.stream;
 final StreamController<String> _descriptionController = StreamController<String>.broadcast();
 Sink<String> get descriptionChange =>_descriptionController.sink;
 Stream<String> get description =>_descriptionController.stream;
 final StreamController<String> _exampleController = StreamController<String>.broadcast();
 Sink<String> get exampleChange => _exampleController.sink;
 Stream<String> get example => _exampleController.stream;
 final StreamController<String> _saveStreamController = StreamController<String>.broadcast();
 Sink<String> get saveKnowledgeChange => _saveStreamController.sink;
 Stream<String> get saveKnowledge => _saveStreamController.stream;
 void dispose(){
  _titleController.close();
  _descriptionController.close();
  _exampleController.close();
  _saveStreamController.close();
 }

 Future<bool> _startEditListeners() async{
  _titleController.stream.listen((title){
    knowledge.title=title;
  });
  _descriptionController.stream.listen((description){
    knowledge.description=description;
  });
  _exampleController.stream.listen((example){
   knowledge.example=example;
  });
  _saveStreamController.stream.listen((action){
   if(action=='Save'){
    _saveKnowledge();
   }
  });
 }

 void _getKnowledge(bool add, Knowledge_txt knowledge_original){
   if(add){
    knowledge = Knowledge_txt();
    knowledge.date = DateTime.now().toString();
    knowledge.title='';
    knowledge.description='';
    knowledge.example='';
   }
   else{
    knowledge.date = knowledge_original.date;
    knowledge.title = knowledge_original.title;
    knowledge.description=knowledge_original.description;
    knowledge.example= knowledge_original.example;
   }
   titleChange.add(knowledge.title);
   descriptionChange.add(knowledge.description);
   exampleChange.add(knowledge.example);
 }
 void _saveKnowledge(){
   print('Save knowledge');
   Knowledge_txt knowledge_to_save = Knowledge_txt(
    knowledge_id: knowledge.knowledge_id,
    title: knowledge.title,
    date:knowledge.date,
    description: knowledge.description,
    example: knowledge.example
   );
   add?fetchApi.createKnowledge(knowledge: knowledge_to_save):fetchApi.updateKnowledge(knowledge: knowledge_to_save);
 }

}