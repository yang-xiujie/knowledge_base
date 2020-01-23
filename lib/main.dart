import 'package:flutter/material.dart';
import 'package:knowledge_base/views/home.dart';
import 'package:knowledge_base/bloc/search_bloc.dart';
import 'package:knowledge_base/bloc/search_bloc_provider.dart';
import 'package:knowledge_base/bloc/home_bloc.dart';
import 'package:knowledge_base/bloc/home_bloc_provider.dart';
import 'package:knowledge_base/services/fetch_api.dart';
import 'package:knowledge_base/services/fetch_api_impl.dart';
void main() => runApp(
    SearchBlocProvider(
      child: MyApp(),
      searchBloc: SearchBloc(),
    )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeBlocProvider(
        homeBloc: HomeBloc(Fetch_Api_Impl()),
        child: Home(),
      ),
    );
  }
}

