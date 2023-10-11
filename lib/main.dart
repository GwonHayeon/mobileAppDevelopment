import "package:flutter/material.dart";

enum Language{cpp, python, dart}

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
  Language _language = Language.cpp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive User Information"),
      ),
      body : ListView(
        children: [
          RadioListTile(
            //무조건 하나를 선택해야함
            //Group value가 존재
            //Group value중 어느것인지 value를 가짐 (isChecked의 개념과 조금 다름)
            title: Text('C++'),
            value: Language.cpp,
            groupValue: _language,
            onChanged: (value){
              setState(() {
                _language = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Python'),
            value: Language.python,
            groupValue: _language,
            onChanged: (value){
              setState(() {
                _language = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('Dart'),
            value: Language.dart,
            groupValue: _language,
            onChanged: (value){
              setState(() {
                _language = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
