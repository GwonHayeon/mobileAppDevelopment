import "package:flutter/material.dart";
enum Team { leader, member }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Home Page',
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
  String text = '';
  double squareside = 100;
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
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                //many animated widget
                width: squareside,
                height: squareside,
                color: Colors.orange,
                duration: const Duration(seconds: 1),
              ),

              onLongPress:(){
                setState(() {
                  if(squareside > 75){
                    squareside = 50;
                    text="This is an orange square";
                  } else{
                    squareside = 100;
                    text='';
                  }
                });
              }
            ),
            SizedBox(
              height: 20,
            ),
            Text(text, style: TextStyle(
              fontSize: 20,
            ),)
          ],
        ),
      )
    );
  }
}

