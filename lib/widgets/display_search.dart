import 'package:flutter/material.dart';
import 'package:knowledge_base/bloc/search_bloc.dart';
import 'package:knowledge_base/bloc/search_bloc_provider.dart';
class DisplaySearch extends StatefulWidget {
  @override
  _DisplaySearchState createState() => _DisplaySearchState();
}

class _DisplaySearchState extends State<DisplaySearch> {
  SearchBloc _searchBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _searchBloc=SearchBlocProvider.of(context).searchBloc;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _searchBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        initialData: '',
        stream: _searchBloc.search,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data);
          }
          else{
            return Text('No Search yet');
          }
        },
      ),
    );
  }
}
