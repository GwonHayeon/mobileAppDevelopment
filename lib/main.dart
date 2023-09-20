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
      body: Stack( //Column대신 Stack을 쓰면 겹쳐짐
        alignment: Alignment.centerLeft, //stack의 property. 앞에거가 세로 뒤가 가로거
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color:Colors.red,
            width:100.0,
            height: 100.0,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0), //바깥여백
          ),
          Container(
            color:Colors.blue,
            width:80.0,
            height: 80.0,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0), //바깥여백
          ),
          Container(
            color:Colors.green,
            width:60.0,
            height: 60.0,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0), //바깥여백
          ),
        ],
      ),
      drawer: Drawer(),//Scaffold의 property
    );
  }
}
