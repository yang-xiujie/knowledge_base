import 'dart:async';
import 'dart:convert';
import 'package:knowledge_base/services/fetch_api.dart';
import 'package:knowledge_base/models/knowledge.dart';
class KnowledgeBloc{
 final FetchApi fetchApi;
 Knowledge_txt knowlegde;
 KnowledgeBloc(this.fetchApi);

}