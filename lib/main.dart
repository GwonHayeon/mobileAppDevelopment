import 'dart:math';
import "package:flutter/material.dart";

enum Language { cpp, python, dart }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const제거
      title: 'Receive User Information',
      theme: ThemeData(
        primarySwatch: Colors.purple, //이것까지 해줘야함
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> myTiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: MyTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: MyTile(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home Page"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: Row(
        children: myTiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_calls),
        onPressed: (){
          setState(() {
            myTiles.insert(1, myTiles.removeAt(0));
          });
        },
      ),
    );
  }
}

class MyTile extends StatefulWidget {
  MyTile({Key? key}) : super(key:key);

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  final Color myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

class UniqueColorGenerator {
  static Random random = Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
