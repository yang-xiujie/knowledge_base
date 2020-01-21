import 'fetch_api.dart';
import 'package:knowledge_base/models/knowledge.dart';
class Fetch_Api_Impl extends FetchApi{
  @override
  Future<void> deleteKnowledge({String knowledgeId}) {
    // TODO: implement deleteKnowledge
    throw UnimplementedError();
  }

  @override
  Future<List<Knowledge_txt>> getAllKnowledge() async{
    // TODO: implement getAllKnowledge
    throw UnimplementedError();
  }

  @override
  Future<Knowledge_txt> getKnowledgeByTitle({String title = ""}) {
    // TODO: implement getKnowledgeByTitle
    throw UnimplementedError();
  }

  @override
  Future<String> createKnowledge({Knowledge_txt knowledge}) {
    // TODO: implement createKnowledge
    throw UnimplementedError();
  }

}