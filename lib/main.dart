// main.dart
import 'package:flutter/material.dart';
import 'package:fullstack_fe/screens/login_screen.dart';
import 'package:fullstack_fe/screens/record_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuseMate',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // 로그인 상태에 따라 시작 화면을 결정할 수 있습니다
      home: const MuseMateLoginScreen(), // 로그인 후 RecordScreen으로 이동
    );
  }
}