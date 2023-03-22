import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import '../../store/color_palette.dart';

class YesNoDialog {
  Future<void> ynDialog({
    required BuildContext context,
    required Function onPressedYes,
    required String description,
    required String Task,
    Function? onPressedNo,
  }) async {
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;
    return Dialogs.bottomMaterialDialog(
        color: ColorPalette.MainBackground,
        context: context,
        msg: description + '\nThe task: ( ${Task} )',
        msgStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Column(
                children: [
                  Container(
                    width: w * 60,
                    child: TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text('cancel'),
                    ),
                  ),
                  Container(
                    width: w * 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        onPressedYes();
                        Navigator.of(context).pop();
                      },
                      child: Text('YES'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
