import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('passed', () {
    final realColor = Color(0xffd1d4c9);

       final map =  {
        "a": realColor.alpha,
        "r": realColor.red,
        "g": realColor.green,
        "b": realColor.blue,
      };
      print(map);
      expect(Color.fromARGB(map['a']!, map['r']!, map['g']!, map['b']!), equals(realColor));
  });
}
