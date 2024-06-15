import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo/data/database.dart';
import 'package:my_todo/util/dialog_box.dart';
import 'package:my_todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Refer Hive Box
  final _myBox = Hive.box('mybox');
  //Text Controller
  final _controller = TextEditingController();
  //Database instance
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //1st Load Ever
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //Data is There
      db.loadData();
    }
    super.initState();
  }

  //Method Checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //Save Task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //Delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('To-Do List'),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              isCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
