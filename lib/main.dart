import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const제거
      title: 'Choose Beverage',
      theme: ThemeData(
        primarySwatch: Colors.brown, //이것까지 해줘야함
      ),
      initialRoute: '/', //'/'는 home임
      routes: {
        '/': (context) => const MyHomePage(),
        '/measureCoffee': (context) => const MeasureYourCoffee(),
        '/milk': (context) => const Milk(),
        '/sweetCoffee': (context) => const SweetCoffee(),
        '/result': (context) => const Result(),
        '/juiceOrLatte': (context) => const JuiceOrLatte(),
        '/coffeeAgain': (context) => const CoffeeAgain(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Beverage"),
      ),
      body: ChooseBeverage(),
    );
  }
}

class ChooseBeverage extends StatelessWidget {
  const ChooseBeverage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "I want to help you choose the beverage",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Let's start!",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("Go"),
            onPressed: () {
              Navigator.pushNamed(context, '/measureCoffee');
            },
          )
        ],
      ),
    );
  }
}


class MeasureYourCoffee extends StatefulWidget {
  const MeasureYourCoffee({super.key});

  @override
  State<MeasureYourCoffee> createState() => _MeasureYourCoffeeState();
}

class _MeasureYourCoffeeState extends State<MeasureYourCoffee> {
  @override
  int cups = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Measure Your Coffee State"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How many cup of coffee did you drink?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${cups} cups",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (cups > 0) {
                        cups--;
                      }
                    });
                  },
                  child: Text('-',style: TextStyle(fontSize: 25),),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cups++;
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 25),),
                ),
              ],
            ),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                if (cups == 1) {
                  Navigator.pushNamed(context, '/milk');
                } else {
                  Navigator.pushNamed(context, '/juiceOrLatte',
                      arguments: cups);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SweetCoffee extends StatelessWidget {
  const SweetCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    String beverage = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sweet Coffee"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Do you want sweet coffee?",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    beverage = "Mocha Latte";
                    Navigator.pushNamed(context, '/result',
                        arguments: beverage);
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () {
                    beverage = "Cafe Latte";
                    Navigator.pushNamed(context, '/result',
                        arguments: beverage);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeAgain extends StatelessWidget {
  const CoffeeAgain({super.key});

  @override
  Widget build(BuildContext context) {
    String beverage = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Again"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Do you want some more coffee?",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sweetCoffee');
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () {
                    beverage = "Sweet Potato Latte";
                    Navigator.pushNamed(context, '/result',
                        arguments: beverage);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JuiceOrLatte extends StatelessWidget {
  const JuiceOrLatte({super.key});

  @override
  Widget build(BuildContext context) {
    final cups = ModalRoute.of(context)?.settings.arguments as int;
    String beverage = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sweet Coffee"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Since you drank ${cups} cup of coffee,",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "you may not want coffee.",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Do you want juice or latte?",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Juice'),
                  onPressed: () {
                    beverage = 'Grapefruit Juice';
                    Navigator.pushNamed(context, '/result',
                        arguments: beverage);
                  },
                ),
                ElevatedButton(
                  child: const Text('Latte'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/coffeeAgain');
//                    setState(() {                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Milk extends StatelessWidget {
  const Milk({super.key});

  @override
  Widget build(BuildContext context) {
    String bevarage = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Milk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Since you drank 1 cup of coffee",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "You may want coffee",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Do you want mlik in coffee?",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sweetCoffee');
                    // setState(() {                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () {
                    bevarage = 'Americano';
                    Navigator.pushNamed(context, '/result',
                        arguments: bevarage);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    final beverage = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your best beverage is",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              beverage,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          // Navigator.pushNamed(context, '/');
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
