import "package:flutter/material.dart";
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const제거
      title: 'Receive User Information',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, //이것까지 해줘야함
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive User Information"),
      ),
      body : Checkbox(
        value: _isChecked,
        onChanged: (value){ //체크박스를 누르면 true가 되므로 아래를 수행한다
            setState(() { //다시 그려주는 함수. setState가 없다면 상태가 변하지 않는다
              // bool ? vlaue => null, true, false 세가지 속성을 가짐
             _isChecked = value!; // !를 쓰는 이유는 NullSafety 때문 (not null) 이값이 null일 수도 있다면 !를 붙이면 안됨
             print(_isChecked);
             print(value);
          });
        },
      ),
    );
  }
}
