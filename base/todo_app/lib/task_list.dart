import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TaskList extends StatefulWidget {
  String addValue;
  final bool completed;
  final bool pending;

  TaskList({
    Key key,
    this.addValue,
    this.completed,
    this.pending,
  }) : super(key: key);

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
    if (widget.addValue.length > 0) {
      listOfTodo.add(Todo(
        name: widget.addValue,
        check: false,
      ));

      setState(() {});
      widget.addValue = '';
    }

    List<Todo> filterList = listOfTodo;
    if (!widget.pending && widget.completed) {
      filterList = listOfTodo.where((element) => element.check).toList();
    } else if (widget.pending && !widget.completed) {
      filterList = listOfTodo.where((element) => !element.check).toList();
    }

    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        final done = filterList[index].check;

        return Container(
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
                  filterList[index].name,
                  style: TextStyle(
                    decoration: done ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                Checkbox(
                  value: done,
                  onChanged: (value) {
                    filterList[index].check = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
