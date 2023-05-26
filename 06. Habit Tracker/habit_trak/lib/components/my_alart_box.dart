import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  const MyAlertBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    required this.hintText,
  });

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade300,
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade100),
            )),
      ),
      actions: [
        MaterialButton(
          onPressed: onCancel,
          color: Colors.green.shade400,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          onPressed: onSave,
          color: Colors.green.shade600,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
