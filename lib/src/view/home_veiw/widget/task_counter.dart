import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/mob_x/task_store.dart';
import 'package:todox/src/core/store/color_palette.dart';

class TaskCounter extends StatefulWidget {
  const TaskCounter({super.key});

  @override
  State<TaskCounter> createState() => _TaskCounterState();
}

class _TaskCounterState extends State<TaskCounter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final task_store = Provider.of<TaskStore>(context);
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;

    return Center(
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(bottom: 20, top: 50),
        decoration: BoxDecoration(
          color: ColorPalette.SecondaryBG,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Observer(
                builder: (_) => Container(
                  child: Text(
                    task_store.AllData.length
                        .toString(), // db de bulunan toplam task sayısı
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
