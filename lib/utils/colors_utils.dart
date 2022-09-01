import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice_maniac/utils/not.dart';
import 'package:random_color/random_color.dart';
import 'package:practice_maniac/utils/defined.dart';

class BlockColors {
  final List<Color> all = const [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];

  const BlockColors();

  List<Color> exclude(List<Color> others) {
    return all
        .where(
          (color) => Not(others.contains(color)).value,
        )
        .toList();
  }
}

class UniqueColorList {
  final Iterable<Color> colors;

  Map<String, bool>? _unique;
  Map<String, bool> get unique => _colorsMap();

  UniqueColorList(this.colors);

  bool has(Color color) {
    final expected = unique[color.toString()];
    return Defined(expected).exist();
  }

  Map<String, bool> _colorsMap() {
    if (Defined(_unique).not.exist()) {
      _unique = _build();
    }

    return _unique!;
  }

  Map<String, bool> _build() {
    return {
      for (var color in colors) color.toString(): true,
    };
  }
}

class ColorPallet {
  final RandomColor provider = RandomColor();

  Color pick() {
    return provider.randomColor();
  }

  Color unique(UniqueColorList colors) {
    var generated = pick();

    while (colors.has(generated)) {
      generated = pick();
    }

    return generated;
  }

  Color uniqueFromIterable(Iterable<Color> picked) {
    final colors = UniqueColorList(picked);
    return unique(colors);
  }
}
