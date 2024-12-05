import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final void Function({required String todoText}) addTodo;

  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add Todo:'),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            hintText: "Write your todo here..",
          ),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        ElevatedButton(
          onPressed: () {
  
            widget.addTodo(todoText: todoText.text);
            todoText.text = "";
          },
          child: Text('Add'),
        )
      ],
    );
  }
}
