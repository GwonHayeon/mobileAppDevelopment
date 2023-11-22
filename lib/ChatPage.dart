import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _authentication = FirebaseAuth.instance;

  //current user을 받아로것임
  User? loggedUser; //Null이 될 수도 있음
  //이거 빌드에서 받으면 비효율적이어서 스테이트가 만들어진 시점에만 업데이트
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser; //현재 로그인이 되어있는 유저 받아오기
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your email is',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              loggedUser!.email!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
