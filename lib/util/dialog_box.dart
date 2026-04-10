import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key, 
  required this.controller, 
  required this.onSave, 
  required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent,
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //text field to add new todo
            TextField(
              controller: controller,
              //for getting user input
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new todo",
              ),
            ),
            SizedBox(height: 20),
            //button to save the new todo
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button 
                MyButton(text: 'save', onPressed: onSave),


                const SizedBox(width: 8),

                 //cancel button
                 // MyButton(text: "Cancel", onPressed: (){}),
                 MyButton(text: 'cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}