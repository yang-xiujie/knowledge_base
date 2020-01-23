import 'package:flutter/material.dart';
import 'package:knowledge_base/bloc/knowledge_bloc.dart';
import 'package:knowledge_base/bloc/knowledge_bloc_provider.dart';
import 'package:knowledge_base/models/knowledge.dart';

class EditKnowledgeWidget extends StatefulWidget {
  @override
  _EditKnowledgeWidgetState createState() => _EditKnowledgeWidgetState();
}

class _EditKnowledgeWidgetState extends State<EditKnowledgeWidget> {
  KnowledgeBloc _knowledgeBloc;
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  TextEditingController _exampleTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController=TextEditingController();
    _descriptionTextController=TextEditingController();
    _exampleTextController=TextEditingController();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _knowledgeBloc = KnowledgeBlocProvider.of(context).knowledgeBloc;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _knowledgeBloc.dispose();
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    _exampleTextController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    void _addOrUpdateKnowledge(){
      print('In _addOrUpdateKnowledge');
      _knowledgeBloc.saveKnowledgeChange.add('Save');
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Knowledge'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(
                stream: _knowledgeBloc.title,
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Container();
                  }
                  _titleTextController.value = _titleTextController.value.copyWith(text:snapshot.data);
                  return TextField(
                    controller: _titleTextController,
                    textInputAction: TextInputAction.newline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    maxLines: 2,
                    onChanged: (title)=>_knowledgeBloc.titleChange.add(title),
                  );
                },
              ),
              Text('Create Date: ${_knowledgeBloc.knowledge.date!=null?_knowledgeBloc.knowledge.date:DateTime.now().toUtc()}'),
              StreamBuilder(
                stream: _knowledgeBloc.description,
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Container();
                  }
                  _descriptionTextController.value=_descriptionTextController.value.copyWith(text:snapshot.data);
                  return TextField(
                    controller: _descriptionTextController,
                    textInputAction: TextInputAction.newline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Description'
                    ),
                    maxLines: null,
                    onChanged: (description)=>_knowledgeBloc.descriptionChange.add(description),
                  );
                },
              ),
              StreamBuilder(
                stream:_knowledgeBloc.example,
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Container();
                  }
                  _exampleTextController.value=_exampleTextController.value.copyWith(text:snapshot.data);
                  return TextField(
                    controller: _exampleTextController,
                    textInputAction: TextInputAction.newline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Example'
                    ),
                    maxLines: null,
                      onChanged: (example)=>_knowledgeBloc.exampleChange.add(example),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    color: Colors.grey.shade100,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10.0,),
                  FlatButton(
                    child: Text('Save'),
                    color: Colors.lightGreen.shade100,
                    onPressed: (){
                      _addOrUpdateKnowledge();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
