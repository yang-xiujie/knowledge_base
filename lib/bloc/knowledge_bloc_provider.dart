import 'knowledge_bloc.dart';
import 'package:flutter/material.dart';

class KnowledgeBlocProvider extends InheritedWidget{
  final KnowledgeBloc knowledgeBloc;
  const KnowledgeBlocProvider({Key key, Widget child,this.knowledgeBloc}):super(key:key,child:child);
  static KnowledgeBlocProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<KnowledgeBlocProvider>();
  }

  @override
  bool updateShouldNotify(KnowledgeBlocProvider oldWidget) {
    return knowledgeBloc!=oldWidget.knowledgeBloc;
  }

}