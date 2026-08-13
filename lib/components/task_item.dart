import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  final String taskTitle;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onEdit;
  Function(BuildContext)? onDelete;

  TaskItem({
    super.key,
    required this.taskTitle,
    required this.isCompleted,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Slidable(
        // startActionPane: ActionPane(
        //   motion: StretchMotion(),
        //   extentRatio: 0.2,
        //   children: [
        //     SlidableAction(
        //       onPressed: onEdit,
        //       icon: Icons.edit,
        //       backgroundColor: Colors.green.withAlpha(175),
        //       borderRadius: BorderRadius.circular(24),
        //     ),
        //   ],
        // ),

        endActionPane: ActionPane(
          motion: StretchMotion(),
          extentRatio: 0.4,
          children: [
            //* EDIT ITEM
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              backgroundColor: Colors.green.withAlpha(175),
              borderRadius: BorderRadius.circular(24),
              flex: 10,
            ),
            
            Spacer(flex: 1,),
            
            //* DELETE ITEM
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete_outline_rounded,
              backgroundColor: Colors.red.withAlpha(175),
              borderRadius: BorderRadius.circular(24),
              flex: 10,
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(120),
                offset: Offset(0, 2),
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Row(
            spacing: 4,
            children: [
              //* CHECKBOX
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.black87,
              ),

              //* TASK TITLE
              Flexible(
                child: Text(
                  taskTitle,
                  style: TextStyle(
                    // decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color: isCompleted ? Colors.grey : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
