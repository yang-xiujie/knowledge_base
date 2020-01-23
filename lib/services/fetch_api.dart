import 'package:knowledge_base/models/knowledge.dart';

abstract class FetchApi{
  Stream<List<Knowledge_txt>> getAllKnowledge();
  Future<Knowledge_txt> getKnowledgeByTitle({String title=""});
  Future<void> deleteKnowledge(Knowledge_txt knowledge_txt);
  Future<String> createKnowledge({Knowledge_txt knowledge});
  Future<void> updateKnowledge({Knowledge_txt knowledge});
}