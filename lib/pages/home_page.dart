import 'package:flutter/material.dart';

// dependencies
import 'package:hive_flutter/hive_flutter.dart';

// custom widgets/classes
import 'package:todo_application/components/dialog_box.dart';
import 'package:todo_application/components/task_item.dart';
import 'package:todo_application/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Reference HIVE BOX
  final _dataBox = Hive.box("DataBox");
  TaskDatabase db = TaskDatabase();

  // INIT METHOD
  @override
  void initState() { 
    //* If this is the FIRST launch, create DEFAULT DATA
    if (_dataBox.get("TODOLIST") == null) {
      db.createInitialData();
    } 
    //* If app has already been opened before
    else {
      db.loadData();
    }

    super.initState();
  }


  //* TextField Controller
  final _taskTitleController = TextEditingController();

  //* On CHECKED item
  void onItemTapped(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });

    db.updateDatabase();
  }

  //* On SAVE item
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_taskTitleController.text, false]);
      
      Navigator.of(context).pop();
      _taskTitleController.clear();
    });

    db.updateDatabase();
  }

  //* On ADD item
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskTitleController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //* On EDIT item
  void editTask(int index) {
    _taskTitleController.text = db.toDoList[index][0];
    bool initialState = db.toDoList[index][1];

    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskTitleController,
          onSave: () {
            setState(() {
              db.toDoList.removeAt(index);
              db.toDoList.insert(index, [_taskTitleController.text, initialState]);
              
              Navigator.of(context).pop();
              _taskTitleController.clear();

              db.updateDatabase();
            });
          },
          onCancel: () {
            Navigator.of(context).pop();
            _taskTitleController.clear();
          },
        );
      },
    );

    db.updateDatabase();
  }

  //* On DELETE item
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });

    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(Icons.note_alt_outlined, color: Colors.black87),
        title: Text(
          "やること リスト",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TaskItem(
            taskTitle: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            onChanged: (value) => onItemTapped(value, index),
            onEdit: (context) => editTask(index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        // shape: CircleBorder(),
        splashColor: Colors.grey[200],
        elevation: 2,
        child: Icon(Icons.add),
      ),
    );
  }
}
