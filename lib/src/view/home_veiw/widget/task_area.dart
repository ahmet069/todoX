import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/components/task_widget.dart';
import 'package:todox/src/core/service/db_service.dart';
import '../../../core/mob_x/task_store.dart';

class TaskArea extends StatefulWidget {
  const TaskArea({super.key});

  @override
  State<TaskArea> createState() => _TaskAreaState();
}

class _TaskAreaState extends State<TaskArea> {
  DBService db_service = DBService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task_store = Provider.of<TaskStore>(context);
    final size = MediaQuery.of(context).size;
    final h = size.height / 100;
    task_store.UpdateData();
    return Container(
      height: h * 60,
      child: SingleChildScrollView(
          child: Observer(
        builder: (_) => Column(
          children: [
            if (task_store.AllData.isNotEmpty)
              for (int i = 0; i < task_store.AllData.length; i++)
                TaskWidget(
                  content: task_store.AllData[i].task,
                  date: task_store.AllData[i].date,
                  id: task_store.AllData[i].id,
                  bg_color: task_store.AllData[i].bg_color,
                )
          ],
        ),
      )),
    );
  }
}
