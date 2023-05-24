import 'package:flutter/material.dart';
import 'package:todo_list/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade300,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),

            // button save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(onPressed: widget.onCancel, text: 'Cancel'),

                const SizedBox(width: 8),

                // cancel button
                MyButton(onPressed: widget.onSave, text: 'Save')
              ],
            )
          ],
        ),
      ),
    );
  }
}
