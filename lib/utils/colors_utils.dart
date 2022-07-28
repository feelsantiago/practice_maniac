import 'dart:ui';

import 'package:random_color/random_color.dart';
import 'package:practice_maniac/utils/defined.dart';

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
    if (Defined(_unique).empty()) {
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
