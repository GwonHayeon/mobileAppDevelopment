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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = List.generate(20, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Home Page"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              ),),
          ],
        ),
        body: ReorderableListView.builder(
            itemCount: items.length,
            itemBuilder:(c,i){
              return Dismissible(
                background: Container(color: Colors.green,),
                key: ValueKey(items[i]),
                child: ListTile(
                  title: Text("Student ${items[i]}"),
                  leading : const Icon(Icons.home),
                  trailing: const Icon(Icons.navigate_next),
                ),
                onDismissed: (direction){
                  setState(() {
                    items.removeAt(i);
                    print(items);
                  });
                },
              );
            },
            onReorder: (int oldIndex, int newIndex){
                setState(() {
                  if(oldIndex < newIndex){
                    newIndex -= 1;
                  }
                  items.insert(newIndex, items.removeAt(oldIndex));
                  print(items);
                });
          },
        )
    );
  }
}


