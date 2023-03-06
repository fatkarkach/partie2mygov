import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transaction/models/tasks_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";
  String taskdescription = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Add TrANSACtion',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (val) {
              taskTitle = val;
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              if (taskTitle.isNotEmpty) {
                Provider.of<TasksData>(context, listen: false)
                    .addTask(taskTitle, taskdescription);
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}
