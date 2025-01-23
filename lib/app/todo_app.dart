import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/home_screen.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // 디버그 모드 배너 숨기기
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomeScreen(),
        ));
  }
}
