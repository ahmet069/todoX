import 'package:flutter/material.dart';
import 'package:todox/src/core/store/color_palette.dart';

class SetColorService {
  Color getColor({required String color_name}) {
    switch (color_name) {
      case 'light_blue':
        return Color(0xFF98DFD6);
      case 'yellow':
        return Colors.yellow;
      case 'green':
        return Color(0xff03c988);
      case 'white':
        return ColorPalette.WidgetBG;
      case 'turquoise':
        return Colors.black;
      case 'blue_gray':
        return Colors.blueGrey;
      case 'light_purple':
        return Color(0xFFBFACE2);
      default:
        return Colors.black;
    }
  }
}
