// lib/main.dart
import 'package:flutter/material.dart';
import 'package:fullstack_fe/screens/login_screen.dart';
import 'package:fullstack_fe/screens/record_screen.dart';
import 'package:fullstack_fe/screens/metronome_screen.dart';
import 'package:fullstack_fe/screens/score_screen.dart';

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
      home: const MuseMateLoginScreen(),
      routes: {
        '/login': (context) => const MuseMateLoginScreen(),
        '/record': (context) => const RecordScreen(),
        '/metronome': (context) => const MetronomeScreen(),
        '/score': (context) => const ScoreScreen(),
      },
    );
  }
}