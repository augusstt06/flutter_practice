import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.deepPurple[400],
        content: SizedBox(
            height: 129,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Add Todo'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: onCancel,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        )),
                    const SizedBox(width: 8),
                    TextButton(
                        onPressed: onSave,
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            )));
  }
}
