import "package:flutter/material.dart";
import 'style.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //const제거
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue, //기본으로 blue로 설정. 이것만 바꾼다고 해서 색이 바뀌지않음
        primarySwatch: Colors.orange, //이것까지 해줘야함
        //color custormaize

        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final items = List.generate(100, (index)=> index).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Malachite,
        title: const Text('Flutter Demo'), //const를 붙이냐 마느냐는 성능상의 문제. 불필요한 리밴더링 하지 않게 되기때문에 성능이 좋아진다
        // leading: Icon(Icons.add),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: GridView.count(
          crossAxisCount: 3,
        children : [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),

          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),

          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
          ),
        ]
      ),
      drawer: Drawer(),//Scaffold의 property
    );
  }
}
