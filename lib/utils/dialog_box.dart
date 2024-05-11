import 'package:flutter/material.dart';
import 'package:to_do_practice/utils/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
final  controller;
VoidCallback onSave;
VoidCallback onCancel;
  @override

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 220,
        child: Column(
          children: [
            TextField(
controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black
                  )

                ),
                hintText: 'Add a New Task'
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(top: 8),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   MyButton(buttonName: 'Save', onPressed: onSave,),
                   MyButton(buttonName: 'Cancel', onPressed: onCancel,)
                 ],
               ),
             )

          ],
        ),
      ),
    );
  }
}
