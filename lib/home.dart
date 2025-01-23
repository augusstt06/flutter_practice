import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('Sample Todo'),
        backgroundColor: Colors.deepPurple[400],
        // 그림자 깊이
        elevation: 10,
      ),
      body: Column(
        children: [
          TodoItem(
            onChanged: (value) {},
            todoText: 'Todo',
            isChecked: false,
          )
        ],
      ),
    );
  }
}
