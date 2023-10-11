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
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive User Information"),
      ),
      body : ListView(
        children: [
          SwitchListTile(
            title : Text("Test"),
            value: _isChecked,
            onChanged: (value){ //체크박스를 누르면 true가 되므로 아래를 수행한다
                setState(() { //다시 그려주는 함수. setState가 없다면 상태가 변하지 않는다
                  // bool ? vlaue => null, true, false 세가지 속성을 가짐
                 _isChecked = value!;
              });
            },
          ),
          CheckboxListTile(
            title : Text("Test2"),
            value: _isChecked2,
            onChanged: (value){ //체크박스를 누르면 true가 되므로 아래를 수행한다
              setState(() { //다시 그려주는 함수. setState가 없다면 상태가 변하지 않는다
                // bool ? vlaue => null, true, false 세가지 속성을 가짐
                _isChecked2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title : Text("Test3"),
            value: _isChecked3,
            onChanged: (value){ //체크박스를 누르면 true가 되므로 아래를 수행한다
              setState(() { //다시 그려주는 함수. setState가 없다면 상태가 변하지 않는다
                // bool ? vlaue => null, true, false 세가지 속성을 가짐
                _isChecked3 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
