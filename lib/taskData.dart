
import 'package:button/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{
  final List<Task> todoList = <Task>[];
  final List<Widget> todoWidgets = <Widget>[];
  List<Color>? pickColor=[Colors.redAccent,Colors.blue,Colors.green];
  final TextEditingController textFieldController = TextEditingController();

  int get notesCount {
    return todoList.length;
  }

  void deleteTask(BuildContext context,Task task) {
    todoList.remove(task);
    print(todoList.length);
    // todoWidgets.remove(buildTodoItem(context,task.name));
    notifyListeners();
  }

  void deleteTitle(BuildContext context,Task task) {
      todoList.remove(task);
      Navigator.pop(context);
    notifyListeners();
  }
  void addTodoItem(String title) {
    todoList.add(Task(name:title));
    textFieldController.clear();
    notifyListeners();
  }
// to show notes
  List<Widget> getNotes(BuildContext context) {
    for (Task title in todoList) {
      todoWidgets.add(buildTodoItem(context,title.name));
    }
    notifyListeners();
    return todoWidgets;
  }


}
class Task {
  final String name;
  Task({required this.name,});

}