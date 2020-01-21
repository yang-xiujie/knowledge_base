import 'package:flutter/material.dart';
import 'package:knowledge_base/bloc/search_bloc.dart';
import 'package:knowledge_base/bloc/search_bloc_provider.dart';
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  SearchBloc _searchBloc;
  TextEditingController _searchcontroller = new TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _searchBloc = SearchBlocProvider.of(context).searchBloc;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _searchcontroller.dispose();
    _searchBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _searchBloc.search,
      builder: (context,snapshot){
        return TextField(
          controller: _searchcontroller,
          decoration: InputDecoration(
            hintText: 'Search',
            labelText: 'Search Box',
            hoverColor:Colors.blueAccent[600],
          ),
          onChanged: (value){
            _searchBloc.searchChanged.add(value);
          },
          onSubmitted: (value){
            _searchBloc.searchChanged.add(value);
          },
        );
      },
    );
  }
}
