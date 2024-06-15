import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  //ref our hive box
  final _myBox = Hive.box('myBox');

  //1st Launch
  void createInitialData() {
    toDoList = [
      ["This Is a Task", false],
      ["Check To mark as complete", true],
      ["Swipe To Delete", false],
    ];
  }

  //Load Data From DB
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //Update The DB
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
