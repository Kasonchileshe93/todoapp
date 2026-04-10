import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
    final String taskName;
    final bool taskCompleted; 
    final Function(bool?)? onChanged;
    final Function(BuildContext)? deleteFunction;




  const TodoTile({
  super.key, 
  required this.taskCompleted, 
  required this.taskName, 
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {  
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          // ignore: sort_child_properties_las
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
            child: Row(
              children: [
                //CHECKBOX
                 // ignore: prefer_const_literals_to_create_immutables
                 Checkbox(
                 value: taskCompleted, 
                 onChanged: onChanged,
                 activeColor: Colors.black,
                 ),          
              //TASK NAME
                 Text(
                  taskName,
                  style: TextStyle(
                    //adding a line through the text if the task is completed
                    decoration: taskCompleted
                     ? TextDecoration.lineThrough 
                     : TextDecoration.none,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                    color: Colors.black,
                  )
                  ),
            
             
              ],
            ),
          ),
      ),
      );
  }
}