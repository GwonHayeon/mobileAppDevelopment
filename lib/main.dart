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
        primarySwatch: Colors.purple, //이것까지 해줘야함
      ),
      initialRoute: '/', //'/'는 home임
      routes: {
        '/' : (context) => const MyHomePage(),
        '/result' : (context) => const ResultPage(),
        '/grade' : (context) => const GradePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StudentResult studentResult = StudentResult(0, 0, 0, 0, true);

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
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  StudentResult studentResult = StudentResult(0, 0, 0, -1, true);
  String grade = '';

  final _midtermController = TextEditingController();
  final _finalController = TextEditingController();
  String _grade = " ";
  Team _team = Team.leader;
  final _valueList = List.generate(10, (index) => "$index point");
  var _selectedValue = '0 point';
  bool _isAbsense = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mid-term exam',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insert some text";
                  } else if (int.tryParse(value) == null) {
                    return 'Insert some integer';
                  }
                  return null;
                },
                onSaved: (value) {
                  studentResult.midTermExam = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Final-term exam',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insert some text";
                  } else if (int.tryParse(value) == null) {
                    return 'Insert some integer';
                  }
                  return null;
                },
                onSaved: (value) {
                  studentResult.finalTermExam = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Additional Point'),
                value: studentResult.additionalPoint,
                items: List.generate(
                  11,
                  (i) {
                    if (i == 0) {
                      return DropdownMenuItem(
                        value: i - 1,
                        child: const Text('Choose the additioinal point'),
                      );
                    }
                    return DropdownMenuItem(
                      value: i - 1,
                      child: Text('${i - 1} point'),
                    );
                  },
                ),
                onChanged: (value) {
                  setState(() {
                    studentResult.additionalPoint = value!;
                  });
                },
                validator: (value) {
                  if (value == -1) {
                    return 'Please select the point';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text("Team Leader (+10)"),
                        value: Team.leader,
                        groupValue: _team,
                        onChanged: (value) {
                          setState(() {
                            _team = value!;
                          });
                        }),
                    RadioListTile(
                        title: Text("Team Member"),
                        value: Team.member,
                        groupValue: _team,
                        onChanged: (value) {
                          setState(() {
                            _team = value!;
                          });
                        }),
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
              ElevatedButton(
                  child: const Text('Enter'),
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("processing data")));
                        _formKey.currentState!.save();
                        studentResult.computeSum();
                        //Routing
                        Navigator.pushNamed(context, '/result', arguments: studentResult);
                      }
                    });
                  }),
              ElevatedButton(
                  child: const Text('Grade'),
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("processing data")));
                        _formKey.currentState!.save();
                        studentResult.computeSum();
                        if(studentResult.totalPoint! >= 60){
                          grade = 'A';
                        }else {
                          grade = 'B';
                        }
                        //Routing
                        Navigator.pushNamed(context, '/grade', arguments: grade);
                      }
                    });
                  }),
            ],
          )),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, this.result});

  final StudentResult? result; //null을 받을 수도 있다

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as StudentResult;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grade Calculator"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total Sum',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${result.totalPoint}',
              //'${result?.totalPoint}',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Insert Again'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}


class GradePage extends StatelessWidget {
  const GradePage({super.key, this.result});

  final StudentResult? result; //null을 받을 수도 있다

  @override
  Widget build(BuildContext context) {
    final grade = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grade"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Grade',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              grade,
              //'${result?.totalPoint}',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Insert Again'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class StudentResult {
  int midTermExam;
  int finalTermExam;
  int teamLeaderPoint;
  int additionalPoint;
  bool attendance;
  int? totalPoint; //null이 될 수도 있음

  StudentResult(
    this.midTermExam,
    this.finalTermExam,
    this.teamLeaderPoint,
    this.additionalPoint,
    this.attendance,
  );

  computeSum() {
    if (additionalPoint != -1) {
      totalPoint =
          midTermExam + finalTermExam + teamLeaderPoint + additionalPoint;
      if (!attendance) {
        totalPoint = 0;
      }
    }
  }

  @override
  String toString() {
    return '('
        '$midTermExam,'
        '$finalTermExam,'
        '$teamLeaderPoint,'
        '$additionalPoint, '
        '$attendance)';
  }
}
