import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final bool isChecked;
  final String todoText;

  final Function(bool?)? onChanged;
  const TodoItem(
      {super.key,
      required this.isChecked,
      required this.todoText,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(24),
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.deepPurple[500],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              Checkbox(onChanged: onChanged, value: isChecked),
              Text(todoText)
            ])));
  }
}
