import 'package:flutter/material.dart';
import 'search_bloc.dart';

class SearchBlocProvider extends InheritedWidget{
  final SearchBloc searchBloc;
  const SearchBlocProvider({Key key,this.searchBloc,Widget child}):super(key:key,child:child);
  static SearchBlocProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<SearchBlocProvider>();
  }

  @override
  bool updateShouldNotify(SearchBlocProvider oldWidget) =>searchBloc!=oldWidget.searchBloc;

}
