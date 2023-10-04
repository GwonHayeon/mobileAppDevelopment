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
        primarySwatch: Colors.blue, //이것까지 해줘야함
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
    return DefaultTabController( //탭바 쓰려면 이걸로 감싸줘야함
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.Malachite,
          title: const Text('Flutter Demo'), //const를 붙이냐 마느냐는 성능상의 문제. 불필요한 리밴더링 하지 않게 되기때문에 성능이 좋아진다
          // leading: Icon(Icons.add),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon:Icon(Icons.tag_faces)),
              Tab(text: "Menu",),
              Tab(icon:Icon(Icons.info), text: "Info"),
            ],
          ),
        ),
        body: TabBarView(
          children : [
            Tab(
              child: Padding(
                padding: const EdgeInsets.only(left:10, right:20),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ]
        ),
        drawer: Drawer(),//Scaffold의 property
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label:"Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label:"Notifications"),
          ],
        ),
      ),
    );
  }
}
