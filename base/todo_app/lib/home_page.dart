import 'package:flutter/material.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/task_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newValue = '';
  bool completed = false;
  bool pending = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Todo',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Pending'),
                          Checkbox(
                            value: pending,
                            onChanged: (value) {
                              setState(() {
                                pending = value;
                              });
                            },
                          ),
                          SizedBox(width: 30),
                          Text('Completed'),
                          Checkbox(
                            value: completed,
                            onChanged: (value) {
                              setState(() {
                                completed = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TaskList(
                        addValue: newValue,
                        completed: completed,
                        pending: pending,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () => openModal(context),
        child: Icon(Icons.adb),
      ),
    );
  }

  void openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(
            addNewTask: (value) {
              newValue = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
