import 'package:flutter/material.dart';
import 'package:flutterpractice/editpage.dart';
import 'package:flutterpractice/scores.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScorePanel(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditPage()));
              },
              child: Text('Edit'))
        ],
      ),
    );
  }
}

class ScorePanel extends StatelessWidget {
  const ScorePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mid Term',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              //context.watch<Scores>().midTermExam.toString(),
              //성능을 위해서는 midTerm이 바뀔 때 midTerm만 받아오게 하는게 더 좋다
              // => watch와 select의 차이
              context.select((Scores s) => s.midTermExam).toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Final',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              // context.watch<Scores>().finalExam.toString(),
              context.select((Scores s) => s.finalExam).toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
