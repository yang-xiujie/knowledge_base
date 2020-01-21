import 'package:knowledge_base/models/knowledge.dart';

abstract class FetchApi{
  Future<List<Knowledge_txt>> getAllKnowledge();
  Future<Knowledge_txt> getKnowledgeByTitle({String title=""});
  Future<void> deleteKnowledge({String knowledgeId});
  Future<String> createKnowledge({Knowledge_txt knowledge});
}