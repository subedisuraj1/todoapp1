import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  final List<String> todoList;
  final void Function() updateLocalData;
  const Todolist(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  void onItemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                  Navigator.pop(context);
                },
                child: const Text("Mark as Done")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(
            child: Text("No items on your List"),
          )
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  onTap: () {
                    onItemClicked(index: index);
                  },
                  title: Text(widget.todoList[index]),
                ),
              );
            });
  }
}
