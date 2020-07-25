import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Todo',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 80),
            Container(
              height: size.height * 0.70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: -3,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  )
                ],
              ),
              child: _TodoContainer(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {},
        child: Icon(Icons.adb),
      ),
    );
  }
}

class _TodoContainer extends StatefulWidget {
  @override
  __TodoContainerState createState() => __TodoContainerState();
}

class __TodoContainerState extends State<_TodoContainer> {
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
