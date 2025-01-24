import 'package:flutter/material.dart';
import 'package:flutter_practice/db/db.dart';
import 'package:flutter_practice/utils/dialog_box.dart';
import 'package:flutter_practice/utils/todo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  // db 인스턴스 생성
  final _todoBox = Hive.box('todoBox');
  DataBase db = DataBase();

  @override
  void initState() {
    if (_todoBox.get('todoList') == null) {
      db.createData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // 체크박스 클릭 함수
  void handlecheckBox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void changeHandler(bool? value) {
    // setState();
  }

  void saveTodo() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
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

  void deleteTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateData();
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
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              isChecked: db.todoList[index][1],
              todoText: db.todoList[index][0],
              onChanged: (value) => handlecheckBox(value, index),
              onDeletePressed: (context) => deleteTodo(index),
            );
          },
        ));
  }
}
