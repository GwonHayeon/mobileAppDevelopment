import "package:flutter/material.dart";

enum Language { cpp, python, dart }

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
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _obesity = "Normal";

  void dispose() {
    //위젯이 사라졌을때 수행되는 함수
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive User Information"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height',
                ),
                controller: _heightController,
                keyboardType: TextInputType.number, //키보드 타임 숫자로하기
              ),
              Container(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight',
                ),
                controller: _weightController,
              ),
              Container(
                height: 20,
              ),
              Text(
                _obesity,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //아무것도 넣지 않으면 그냥 다시 그리기만한다
                    var heightValue = double.parse(_heightController.text.trim());
                    var weightValue = double.parse(_weightController.text.trim());
                    if (weightValue/(heightValue * heightValue) > 25){
                      _obesity = "Obesity";
                    } else{
                      _obesity = "Normal";
                    }
                  });
                },
                child: Text("Enter"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
