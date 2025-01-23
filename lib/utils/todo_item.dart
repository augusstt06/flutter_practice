import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple[500],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [Text("Item")],
        ));
  }
}
