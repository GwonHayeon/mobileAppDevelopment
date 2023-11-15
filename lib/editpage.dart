import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>DetailedScores(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("Edit Score"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditPanel(),
            Text('Additional Midterm',style: TextStyle(fontSize: 20),),
            Text(context.watch<DetailedScores>().additionalMidterm.toString(), style: TextStyle(fontSize: 20),),
            Text('Additional Final',style: TextStyle(fontSize: 20),),
            Text(context.watch<DetailedScores>().additionalFinal.toString(),style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}

class EditPanel extends StatelessWidget {
  const EditPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Mid-Term',
                style: TextStyle(fontSize: 20),
              ),
              width: 100,
            ),
            TextButton(
                onPressed: () {
                  context.read<Scores>().decreaseMidTerm();
                },
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
                //context.watch<Scores>().midTermExam.toString(),
                //성능을 위해서는 midTerm이 바뀔 때 midTerm만 받아오게 하는게 더 좋다
                // => watch와 select의 차이
                context.select((Scores s) => s.midTermExam).toString(),
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  //그냥 함수만 가져올거라 성능상으로 굳이 watch를 할 필요는 없음
                  //watch는 구독의 개념
                  context.read<Scores>().increaseMidTerm();
                },
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Final',
                style: TextStyle(fontSize: 20),
              ),
              width: 100,
            ),
            TextButton(
                onPressed: () {
                  context.read<Scores>().decreaseFinal();
                },
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              context.select((Scores s) => s.finalExam).toString(),
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  context.read<Scores>().increaseFinal();
    },
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ],
    );
  }
}
