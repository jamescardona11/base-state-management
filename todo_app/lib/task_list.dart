import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Todo> listOfTodo = [
    Todo(name: 'make cookies', check: false),
    Todo(name: 'buy a milk', check: true),
    Todo(name: 'read news', check: false),
    Todo(name: 'create a presentation', check: true),
    Todo(name: 'go to the park', check: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfTodo.length,
      itemBuilder: (context, index) => Container(
        height: 65,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 1),
              spreadRadius: -3,
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listOfTodo[index].name,
                style: TextStyle(
                  decoration: listOfTodo[index].check ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              Checkbox(
                value: listOfTodo[index].check,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
