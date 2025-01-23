import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  // 인스턴스가 생성되는 시점에 값을 넣어줘야 하기 때문에 final 변수 선언
  final bool isChecked;
  final String todoText;
  // onChanged 함수를 인자로 받는데, bool 타입이거나 null 타입
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
              Text(
                todoText,
                style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ])));
  }
}
