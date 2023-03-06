import 'package:flutter/cupertino.dart';
import 'package:transaction/Services/database_services.dart';
import 'package:transaction/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String taskTitle, String taskdescription) async {
    Task task = await DatabaseServices.addTask(taskTitle, taskdescription);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    DatabaseServices.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseServices.deleteTask(task.id);
    notifyListeners();
  }
}
