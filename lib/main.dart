import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soccer Game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Soccer Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _yourScore = 0;
  int _rivalScore = 0;
  int _win = 0;
  int _lose = 0;
  int _draw=0;

  void _yourTeamWin() {
    setState(() {
      _yourScore++;
    });
  }
  void _rivalTeamWin() {
    setState(() {
      _rivalScore++;
    });
  }
  void _resetGame() {
    setState(() {
      _rivalScore=0;
      _yourScore = 0;
    });
  }

  void _gameOver() {
    setState(() {
      if(_yourScore > _rivalScore) _win++;
      else if(_yourScore < _rivalScore) _lose++;
      else if(_yourScore ==_rivalScore) _draw++;
      _yourScore = 0;
      _rivalScore = 0;
    });
  }

  void _refreshGame() {
    setState(() {
      _yourScore = 0;
      _rivalScore = 0;
      _win = 0;
      _lose = 0;
      _draw=0;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: const Image(
                image: AssetImage(
                    'assets/soccer-1.png'
                ),
                width: 130.0,
              ),
            ),
            ElevatedButton(onPressed: _resetGame, child: const Text('Reset Game')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Your Team', style: TextStyle(fontSize: 20),),
                    Text('$_yourScore', style: TextStyle(fontSize: 40),),
                    ElevatedButton(onPressed: _yourTeamWin, child: const Text('Goal')),
                  ],
                ),
                Text(':', style: TextStyle(fontSize: 40),),
                Column(
                  children: [
                    Text('Your Rival', style: TextStyle(fontSize: 20),),
                    Text('$_rivalScore', style: TextStyle(fontSize: 40),),
                    ElevatedButton(onPressed: _rivalTeamWin, child: const Text('Goal')),
                  ],
                ),
              ],
            ),
            ElevatedButton(onPressed: _gameOver, child: const Text('Game Over')),
            Container(
              padding: EdgeInsets.only(top:10,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Set Score', style: TextStyle(fontSize: 40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Win: $_win', style: TextStyle(fontSize: 25),),
                      Text('Draw: $_draw', style: TextStyle(fontSize: 25),),
                      Text('Lose: $_lose', style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshGame,
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

