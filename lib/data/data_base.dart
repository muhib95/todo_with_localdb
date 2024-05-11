import 'package:hive_flutter/adapters.dart';

class ToDoDataBase{
  List items = [

  ];
  final _myBox=Hive.box('myBox');
  void initialState(){
     items=[
      ['Do This', false],
      ['Flutter This', false]
    ];
  }
  void loadData(){
items=_myBox.get('TODOLIST');
  }
  void updateDatabase(){
_myBox.put('TODOLIST', items);
  }
}