import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterpractice/SuccessRegister.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool saving = false;
  final _authentication = FirebaseAuth.instance; //Firebase 인증 소통창구
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                  print(email);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'User name'),
                onChanged: (value) {
                  userName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        saving = true;
                      });
                      //email과 password로 새 유저를 등록
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
                              email: email, password: password);
                      await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({ //비동기
                        'userName':userName,
                        'email' : email,
                      });
                      if (newUser.user != null) {
                        _formKey.currentState!.reset(); //null이 아님을 보장
                        if (!mounted) {
                          return; //위젯이 트리에 마운트 안될수도 있어서 마운트 안되면 리턴하라고 하는거임. 어싱크를 사용해서그럼
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SuccessRegisterPage()));
                        setState(() {
                          saving = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Register")),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("If you already registered"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Log in with your email'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
