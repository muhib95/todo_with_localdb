import 'package:flutter/material.dart';
import 'package:to_do_practice/data/data_base.dart';
import 'package:to_do_practice/utils/dialog_box.dart';
import 'package:to_do_practice/utils/todo_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox=Hive.box('myBox');
  final  _controlle=TextEditingController();
  ToDoDataBase db=ToDoDataBase();
  @override
  void initState() {
    if(_myBox.get('TODOLIST')==null){
db.initialState();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  void getText(){
    setState(() {
      db.items.add([_controlle.text,false]);
    });
    db.updateDatabase();
    Navigator.of(context).pop();
    _controlle.clear();
  }
  void cancelTextInput(){
    db.updateDatabase();
    _controlle.clear();
    Navigator.of(context).pop();
  }
  @override
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(controller:_controlle, onSave: getText, onCancel: cancelTextInput,);
    },);
  }
  bool isChange = false;


  void changeValue(bool? data, int index) {
    setState(() {
      db.items[index][1] = data;
    });
    db.updateDatabase();
  }
  void deleteTask(int index) {
    setState(() {
      db.items.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'To do App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: db.items.length,
        itemBuilder: (context, int index) {
          return ToDoList(
            todoName: db.items[index][0],
            taskCompleted: db.items[index][1],
            changeCheck: (e) => changeValue(e, index),
            dF: (p0) => deleteTask(index),
          );
        },
      ),
    );
  }
}
