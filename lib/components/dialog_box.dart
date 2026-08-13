import 'package:flutter/material.dart';
import 'package:todo_application/components/primary_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.grey[800],
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        height: 168,
        child: Column(
          spacing: 12,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(Icons.add_box_outlined, color: Colors.black87),
                Text(
                  "ADD TASK",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight(800),
                  ),
                ),
              ],
            ),

            //* INPUT FOR TASK TITLE
            TextField(
              controller: controller,
              cursorColor: Colors.black54,
              cursorHeight: 20,
              cursorRadius: Radius.circular(8),
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Task Title",
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black45, width: 1),
                ),
              ),
            ),

            //* CONFIRM AND CANCEL BUTTONS
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* SAVE BUTTON
                  PrimaryButton(
                    text: "Save",
                    size: Size(110, 44),
                    onPressed: onSave,
                  ),

                  //* CANCEL BUTTON
                  PrimaryButton(
                    text: "Cancel",
                    size: Size(110, 44),
                    onPressed: onCancel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
