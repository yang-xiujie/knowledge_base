import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_base/bloc/home_bloc.dart';
import 'package:knowledge_base/bloc/home_bloc_provider.dart';
import 'package:knowledge_base/bloc/knowledge_bloc.dart';
import 'package:knowledge_base/bloc/knowledge_bloc_provider.dart';
import 'package:knowledge_base/models/knowledge.dart';
import 'package:knowledge_base/views/edit_knowledge.dart';
import 'package:knowledge_base/widgets/search_text_widget.dart';
import 'package:knowledge_base/bloc/search_bloc.dart';
import 'package:knowledge_base/bloc/search_bloc_provider.dart';
import 'package:knowledge_base/widgets/display_search.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SearchBloc _searchBloc;
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _searchBloc = SearchBlocProvider.of(context).searchBloc;
    _homeBloc = HomeBlocProvider.of(context).homeBloc;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _searchBloc.dispose();
    _homeBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var isMobile = width< 600;
    Future<void> _addOrEditKnowledge({bool add,Knowledge_txt knowledge}) async{
      Navigator.push(context,MaterialPageRoute(
        builder: (context)=>KnowledgeBlocProvider(
          knowledgeBloc: KnowledgeBloc(_homeBloc.fetchApi,add,knowledge),
          child: EditKnowledgeWidget(),
        ),
        fullscreenDialog: true,
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('UFT Internal Knowledge base'),
        leading: isMobile?IconButton(icon: Icon(Icons.menu),
        onPressed: (){
          //Need to implement
        },):Container(),
        actions: <Widget>[
          SizedBox(
            width: 300.0,
            child: SearchWidget(),
          ),
          IconButton(icon:Icon(Icons.search))
        ],
      ),
      body: DisplaySearch(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 44.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //Add Knowledge
          _addOrEditKnowledge(add:true, knowledge:Knowledge_txt());
        },
      ),
    );
  }
}
