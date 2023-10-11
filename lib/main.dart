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
  final _valueList = List.generate(10, (i) => 'Student $i');
  var _selectedValue = 'Student 0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive User Information"),
      ),
      body : Center(
        child: DropdownButton(
          value: _selectedValue,
          items: _valueList.map(
              (student) => DropdownMenuItem(
                  value : student,
                  child: Text(student))).toList(),
          onChanged: (value){
            setState(() {
              _selectedValue = value!; //_selectedValue에는 리스트값이 들어간다
            });
          },
        ),
      ),
    );
  }
}
