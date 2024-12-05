import 'package:flutter/material.dart';
import 'package:todoapp1/addTodo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = ["Drink Water", "Make Dinner", "Sleep"];
  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("Drawer Data"),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      child: AddTodo(
                        addTodo: addTodo,
                      ),
                      height: 250,
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                todoList.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Mark as Done")),
                      );
                    });
              },
              title: Text(todoList[index]),
            );
          }),
    );
  }
}
