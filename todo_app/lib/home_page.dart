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
  final List<Todo> listOfTodo = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfTodo.length,
      itemBuilder: (context, index) => Container(),
    );
  }
}
