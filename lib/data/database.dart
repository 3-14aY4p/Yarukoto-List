import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  // Task List
  List toDoList = [];

  //* Reference HIVE BOX
  final _dataBox = Hive.box("DataBox");

  //* Run method on FIRST launch
  void createInitialData() {
    toDoList = [
      ["Brush teeth", true],
      ["Cook breakfast", false],
      ["Take a shower", false],
    ];
  }

  //* Load pre-existing data
  void loadData() {
    toDoList = _dataBox.get("TODOLIST");
  }

  //* Update with new data
  void updateDatabase() {
    _dataBox.put("TODOLIST", toDoList);
  }
}
