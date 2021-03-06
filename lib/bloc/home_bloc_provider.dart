import 'home_bloc.dart';
import 'package:flutter/material.dart';

class HomeBlocProvider extends InheritedWidget{
  final HomeBloc homeBloc;
  const HomeBlocProvider({Key key, Widget child, this.homeBloc}):super(key:key, child:child);
  static HomeBlocProvider of(BuildContext context){
   return context.dependOnInheritedWidgetOfExactType<HomeBlocProvider>();
  }

  @override
  bool updateShouldNotify(HomeBlocProvider oldWidget) => homeBloc!=oldWidget.homeBloc;
}