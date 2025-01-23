import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [
    ["Todo", false],
    ["Todo2", true],
    ["Todo3", false],
  ];

  // 체크박스클릭 함수
  void handlecheckBox(bool? value, int index) => setState(() {
        todoList[index][1] = !todoList[index][1];
      });

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
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
                isChecked: todoList[index][1],
                todoText: todoList[index][0],
                onChanged: (value) => handlecheckBox(value, index));
          },
        ));
  }
}
