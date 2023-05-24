import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todoList = [
      ['Default Task', false],
    ];
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // update the database
  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
