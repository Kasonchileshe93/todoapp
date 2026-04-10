import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  //list of todos
  List todoList = [];
  //reference the hive box
  // ignore: unused_field
  Box get _myBox => Hive.box('mybox');
  //create initial data
   void createInitialData() {
    todoList = [
      //the first element in the list is the task name and the second element is whether the task is completed or not
      ["Buy Milk", false],
      ["Buy Eggs", false],
    ];
}
//load the data from the database
void loadData() {
  //if the database is empty, create initial data
  todoList = _myBox.get("TODOLIST") ?? [];
}
//update the database
void updateDataBase() {
  //put the todoList in the database
  _myBox.put("TODOLIST", todoList);
}
}