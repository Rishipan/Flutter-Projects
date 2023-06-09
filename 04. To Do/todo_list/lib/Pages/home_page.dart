import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/util/dialog_box.dart';
import 'package:todo_list/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // Checking was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // cancel new task
  void cancelNewTask() {
    // clear textfield
    _controller.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          hintText: 'Add a new Task',
          onSave: saveNewTask,
          onCancel: cancelNewTask,
        );
      },
    );
  }

  // open habit settings to edit
  void openTaskSetting(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          hintText: db.todoList[index][0],
          onSave: () => saveExistingTask(index),
          onCancel: () => cancelNewTask(),
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingTask(int index) {
    setState(() {
      db.todoList[index][0] = _controller.text;
    });
    _controller.clear();
    Navigator.pop(context);
    db.updateData();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.purple.shade500,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.purple.shade500,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            settingTapped: (context) => openTaskSetting(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      // ReorderableListView.builder(
      //   itemBuilder: (context, index) {
      //     return ToDoTile(
      //       taskName: db.todoList[index][0],
      //       taskCompleted: db.todoList[index][1],
      //       onChanged: (value) => checkBoxChanged(value, index),
      //       settingTapped: (context) => openTaskSetting(index),
      //       deleteFunction: (context) => deleteTask(index),
      //     );
      //   },
      //   itemCount: db.todoList.length,
      //   onReorder: (int oldIndex, int newIndex) {
      //     setState(() {
      //       if (oldIndex < newIndex) {
      //         newIndex -= 1;
      //       }
      //       final int item = db.todoList.removeAt(oldIndex);
      //       db.todoList.insert(newIndex, item);
      //     });
      //   },
      // ),
    );
  }
}
