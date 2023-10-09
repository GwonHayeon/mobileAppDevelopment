import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const제거
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue, //기본으로 blue로 설정. 이것만 바꾼다고 해서 색이 바뀌지않음
        primarySwatch: Colors.indigo, //이것까지 해줘야함
        //color custormaize
        // fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final items = List.generate(15, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //탭바 쓰려면 이걸로 감싸줘야함
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Assignment3'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.image)),
              Tab(
                icon: Icon(Icons.how_to_vote),
              ),
              Tab(icon: Icon(Icons.upload)),
            ],
          ),
        ),
        body: TabBarView(children: [
          Tab(
            child: GridView.count(
              crossAxisCount: 3,
              children: items
                  .map((i) => Container(
                      child: Image(
                          image: AssetImage(
                              'assets/dog_images/dog_${i + 1}.jpeg'))))
                  .toList(),
            ),
          ),
          Container(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Candidate",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        width: 120,
                        height: 100,
                        child: const Center(
                          child: Text(
                            'Dog1',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        width: 120,
                        height: 100,
                        child: const Center(
                          child: Text(
                            'Dog1',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        width: 120,
                        height: 100,
                        child: const Center(
                          child: Text(
                            'Dog1',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Vote rate",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: const Center(child: Text("50%")),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: const Center(child: Text("20%")),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: const Center(child: Text("30%")),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Tab(
            child: LinearProgressIndicator(),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_album), label: "album"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ],
        ),
      ),
    );
  }
}
