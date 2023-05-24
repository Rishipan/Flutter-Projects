import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  //  // reorder method
  // void updateMyTiles(int oldIndex, int newIndex) {
  //   setState(() {
  //     // an adjustment is needed when moving the tile down the list
  //     if (oldIndex < newIndex) {
  //       newIndex--;
  //     }

  //     // get the tile we are moving
  //     final tile = myTiles.removeAt(oldIndex);

  //     // place the tile in the new position
  //     myTiles.insert(newIndex, tile);
  //   });
  // }

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
