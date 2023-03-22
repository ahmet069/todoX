import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/mob_x/task_store.dart';
import 'package:todox/src/core/service/db_service.dart';
import 'package:todox/src/core/service/set_color_service.dart';
import 'package:todox/src/core/store/color_palette.dart';

class SetTaskColorDialog {
  SetColorService setColorService = SetColorService();
  DBService db_service = DBService();
  Future<void> dialog({
    required BuildContext context,
    required Color color,
    required Color bg_color,
    required int task_id,
  }) async {
    return Dialogs.bottomMaterialDialog(
      context: context,
      color: ColorPalette.MainBackground,
      actions: [
        Container(
          child: Column(
            children: [
              Text(
                "Current task color",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 60,
                width: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: bg_color),
                  onPressed: () {},
                  child: Icon(
                    Icons.done,
                    color: Colors.black,
                  ),
                ),
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: colorList.length,
                itemBuilder: (BuildContext context, int index) {
                  final task_store = Provider.of<TaskStore>(context);

                  return Container(
                    child: ElevatedButton(
                      child: null,
                      onPressed: () {
                        db_service.updateColor(
                          id: task_id,
                          new_color: colorList[index],
                        );
                        task_store.UpdateData();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: setColorService.getColor(
                          color_name: colorList[index],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  List<String> colorList = [
    'white',
    'light_blue',
    'yellow',
    'green',
    'blue_gray',
    'light_purple',
  ];
}
