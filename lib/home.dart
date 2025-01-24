import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/dialog_box.dart';
import 'package:flutter_practice/utils/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  List todoList = [
    ["Todo", false],
    ["Todo2", true],
    ["Todo3", false],
  ];

  // 체크박스클릭 함수
  void handlecheckBox(bool? value, int index) => setState(() {
        todoList[index][1] = !todoList[index][1];
      });

  void changeHandler(bool? value) {
    // setState();
  }

  void saveTodo() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onCancel: () => Navigator.of(context).pop(),
              onSave: saveTodo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: Text('Sample Todo', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple[400],
          // 그림자 깊이
          elevation: 10,
        ),
        //
        floatingActionButton: FloatingActionButton(
          onPressed: createTodo,
          backgroundColor: Colors.deepPurple[400],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
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
