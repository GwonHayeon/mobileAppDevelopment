import "package:flutter/material.dart";
import "package:flutterpractice/editpage.dart";
import 'package:provider/provider.dart';
import "package:flutterpractice/scores.dart";
import "package:flutterpractice/socrepage.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(BuildContext context)=>Scores(),//어떤것이 점수에 해당하는 클래스가 될거냐
      builder: (context, child) => MaterialApp( //그냥 child라고 해도 문제는 없다
        title : 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ScorePage(),
      ),
    );
  }
}
