import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/components/dialogs/set_task_color_dialog.dart';
import 'package:todox/src/core/components/dialogs/yes_no_dialog.dart';

import 'package:todox/src/core/mob_x/task_store.dart';
import 'package:todox/src/core/service/set_color_service.dart';
import 'package:todox/src/core/store/color_palette.dart';

import '../service/db_service.dart';

class TaskWidget extends StatefulWidget {
  final String content;
  final int id;
  final String date;
  final String bg_color;
  const TaskWidget({
    super.key,
    required this.content,
    required this.id,
    required this.date,
    required this.bg_color,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  DBService db_service = DBService();
  YesNoDialog yesNoDialog = YesNoDialog();
  SetTaskColorDialog setTaskColorDialog = SetTaskColorDialog();
  SetColorService setColorService = SetColorService();
  void _delete_task({
    required TaskStore task_store,
  }) {
    yesNoDialog.ynDialog(
      context: context,
      Task: widget.content + '\n',
      // description: 'Are you sure the task will be deleted?',
      description: widget.bg_color.toString(),
      onPressedYes: () =>
          db_service.deleteTask(widget.id).then((_) => task_store.UpdateData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;
    final task_store = Provider.of<TaskStore>(context);
    final task_width = w * 86;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: w * 7,
      ),
      child: Slidable(
        key: ValueKey(widget.id),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              db_service
                  .deleteTask(widget.id)
                  .then((_) => task_store.UpdateData());
            },
          ),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (_) => _delete_task(task_store: task_store),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        enabled: true,
        child: ElevatedButton(
          onPressed: () async {
            setTaskColorDialog.dialog(
              context: context,
              color: ColorPalette.WidgetBG,
              task_id: widget.id,
              bg_color: setColorService.getColor(color_name: widget.bg_color),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                setColorService.getColor(color_name: widget.bg_color),
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Container(
            width: task_width,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 4,
                      color: ColorPalette.SecondaryBG,
                    )),
              ),
              Column(
                children: [
                  Container(
                    width: task_width - 75,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      widget.content,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
