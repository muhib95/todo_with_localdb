import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String todoName;
  final bool taskCompleted;
  Function(bool?)? changeCheck;
  Function(BuildContext)? dF;
  ToDoList(
      {super.key,
      required this.todoName,
      required this.taskCompleted,
      required this.changeCheck,
        required this.dF,

      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: dF,
          icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
        ]),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(children: [
              Checkbox(
                value: taskCompleted,
                onChanged: changeCheck,
                activeColor: Colors.black,
              ),
              Text(
                todoName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ]),
          ),
          decoration: BoxDecoration(
              color: Colors.lightBlue, borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
