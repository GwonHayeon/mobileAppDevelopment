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
            ),
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
  StudentResult studentResult = StudentResult(0, 0, 0, 0, true);

  final _formKey = GlobalKey<FormState>();
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
                        value: i,
                        child: const Text('Choose the additioinal point'),
                      );
                    }
                    return DropdownMenuItem(
                      value: i,
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
                  if (value == 0) {
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
                        print(studentResult);
                      }
                    });
                  })
            ],
          )),
    );
  }
}

class StudentResult {
  int midTermExam;
  int finalTermExam;
  int teamLeaderPoint;
  int additionalPoint;
  bool attendance;

  StudentResult(this.midTermExam, this.finalTermExam, this.teamLeaderPoint,
      this.additionalPoint, this.attendance);

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
