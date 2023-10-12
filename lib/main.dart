import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

enum Team { leader, member }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const제거
      title: 'Grade Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange, //이것까지 해줘야함
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
  final _midtermController = TextEditingController();
  final _finalController = TextEditingController();
  String _grade = " ";
  Team _team = Team.leader;
  final _valueList = List.generate(10, (index) => "$index point");
  var _selectedValue = '0 point';
  bool _isAbsense = false;

  void dispose() {
    //위젯이 사라졌을때 수행되는 함수
    _midtermController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Calculator"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Midterm Exam',
              ),
              controller: _midtermController,
              keyboardType: TextInputType.number, //키보드 타임 숫자로하기
            ),
            Container(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Final Exam',
              ),
              controller: _finalController,
              keyboardType: TextInputType.number,
            ),
            RadioListTile(
                title: Text("Project Team Leader (+10)"),
                value: Team.leader,
                groupValue: _team,
                onChanged: (value) {
                  setState(() {
                    _team = value!;
                  });
                }),
            RadioListTile(
                title: Text("Project Team Member"),
                value: Team.member,
                groupValue: _team,
                onChanged: (value) {
                  setState(() {
                    _team = value!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Additional Point",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton(
                          value: _selectedValue,
                          items: _valueList
                              .map((points) => DropdownMenuItem(
                                  value: points,
                                  child: Text(
                                    points,
                                    style: TextStyle(fontSize: 18),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Absence less than 4",
                        style: TextStyle(fontSize: 18),
                      ),
                      Checkbox(
                          value: _isAbsense,
                          onChanged: (value) {
                            setState(() {
                              _isAbsense = value!;
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                _grade,
                style: TextStyle(fontSize: 50, color: Colors.red),
              ),
            ),
            Container(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var midtermValue =
                      double.parse(_midtermController.text.trim());
                  var finalValue = double.parse(_finalController.text.trim());
                  var _addValue = double.parse(_selectedValue[0]);
                  var _bonusValue;
                  if (_team.toString() == "Team.member") {
                    _bonusValue = 0;
                  } else {
                    _bonusValue = 10;
                  }
                  var total =
                      midtermValue + finalValue + _bonusValue + _addValue;
                  if (total < 110 || _isAbsense == false) {
                    _grade = "F";
                  } else if (total >= 110 && total < 130) {
                    _grade = "D";
                  } else if (total >= 130 && total < 150) {
                    _grade = "C";
                  } else if (total >= 150 && total < 170) {
                    _grade = "B";
                  } else if (total >= 170) {
                    _grade = "A";
                  }
                });
              },
              child: Text("Enter", style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
