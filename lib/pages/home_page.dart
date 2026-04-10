import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  //instance of the database class
  TodoDataBase db = TodoDataBase();

  //text controller for getting user input
  final _controller = TextEditingController();

  //init state is called when the app is opened
  @override
  void initState() {
    
    //if this is the first time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
      db.updateDataBase();
    } else {
      //there already exists data, so load it
      db.loadData();
    }

    super.initState();
  }

  //this code is for the checkbox and the list of todos
  // List todoList = [
  //   ["Buy Milk", false],
  //   ["Buy Eggs", false],
  
  // ];
  //checkbox was tapped/?
  void checkboxchanged(bool? value, int index) {
    setState(() {
      //toggle the value of the checkbox
      db.todoList[index][1] = !db.todoList[index][1];
    });
    //update the database when a checkbox is toggled
    db.updateDataBase();
  }
  // save new todo method
  void saveNewTodo() {
    setState(() {
      //the new todo is added to the list with the value of false (not completed)
      db.todoList.add([_controller, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  


    //get the text from the text field
    // final newTodo = _controller.text.trim();
    // //check if the text is empty
    // if (newTodo.isEmpty) {
    // //   return;
    // }
    //add the new todo to the list
    
    
    //update the database when a new todo is added
    
  }
  //calling the method createNewTodo to add new todos to the list
  void createNewTodo() {
    //the box for creating a new todo
    showDialog(
      context: context,
      builder: (dialogContext) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTodo,
          onCancel: () => Navigator.of(dialogContext).pop(),
        );
      },
    );
  }
  //delete todo method
  void deleteTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    //update the database when a todo is deleted
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 184, 6),
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
      ),
      //adding a floating action button to add new todos
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTodo,
          child: const Icon(Icons.add),
        ),
      body: ListView.builder(
        //the code is for the checkbox and the list of todos
        //is the checkbox checked or not? and the index of the checkbox
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) {
              if (value != null) {
                checkboxchanged(value, index);
              }
            },
            deleteFunction: (context) => deleteTodo(index),
          );
        },
       
      ),
    );
  }
}