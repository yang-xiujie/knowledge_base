import 'package:flutter/cupertino.dart';

import 'fetch_api.dart';
import 'package:knowledge_base/models/knowledge.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Fetch_Api_Impl extends FetchApi{
  @override
  Future<void> deleteKnowledge(Knowledge_txt knowledge_txt) {
    // TODO: implement deleteKnowledge
    throw UnimplementedError();
  }

  @override
  Stream<List<Knowledge_txt>> getAllKnowledge() async*{
    // TODO: implement getAllKnowledge
     String jsonString = await rootBundle.loadString('assets/savedKnowledge.json');
     Map<String,dynamic> assetJson = json.decode(jsonString);
     List<Knowledge_txt> listOfKnowledge = List<Knowledge_txt>();
     assetJson.forEach((key,object){
        listOfKnowledge.add(Knowledge_txt.fromJson(object));
     });
      yield listOfKnowledge;
  }

  @override
  Future<Knowledge_txt> getKnowledgeByTitle({String title = ""}) {
    // TODO: implement getKnowledgeByTitle
    throw UnimplementedError();
  }

  @override
  Future<String> createKnowledge({Knowledge_txt knowledge}) async{
    // TODO: implement createKnowledge

  }

  @override
  Future<void> updateKnowledge({Knowledge_txt knowledge}) async {
    // TODO: implement updateKnowledge

    throw UnimplementedError();
  }

}