import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:todox/src/core/service/db_service.dart';
import 'package:todox/src/core/models/task_model.dart';
import 'package:todox/src/core/store/color_palette.dart';

class AddItemDialog {
  DBService db_service = DBService();
  Future<void> addTaskDialog({
    required BuildContext context,
    required TextEditingController taskDescription,
    required Function updateDataFnc,
    required String color,
  }) async {
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;
    return Dialogs.materialDialog(
      context: context,
      color: ColorPalette.MainBackground,
      dialogWidth: w * 100,
      msg: 'Add Task',
      msgStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      actions: [
        Container(
          child: Form(
            child: Column(
              children: [
                Container(
                  width: 80 * w,
                  child: TextFormField(
                    controller: taskDescription,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(221, 255, 255, 255),
                      filled: true,
                      hintText: 'Your task',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Container(
                    width: 30 * w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.floatActionColor,
                      ),
                      onPressed: () async {
                        await db_service
                            .addTask(Task(
                              id: 10,
                              task: taskDescription.text,
                              date: DateTime.now().toString(),
                              importance_level: '1',
                              bg_color: 'white',
                            ))
                            .then((_) =>
                                updateDataFnc()); // update task list after add event
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'ADD TASK',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
