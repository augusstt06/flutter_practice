import 'package:flutter/material.dart';
import 'package:flutter_practice/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  // Hive를 사용해 myBox라는 이름의 데이터 저장소 오픈
  // ignore: unused_local_variable
  var box = await Hive.openBox('todo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(primarySwatch: Colors.purple));
  }
}
