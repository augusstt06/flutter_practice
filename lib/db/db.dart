import 'package:hive_flutter/hive_flutter.dart';

// db 인스턴스 생성을 위한 클래스 생성
class DataBase {
  List todoList = [];

  final _todoBox = Hive.box('todoBox');

  void createData() {
    todoList = [
      ["Todo", false],
      ["Todo2", true],
      ["Todo3", false],
    ];
  }

  void loadData() {
    todoList = _todoBox.get('todoList');
  }

  void updateData() {
    _todoBox.put('todoList', todoList);
  }
}
