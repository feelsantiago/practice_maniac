import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:rx_widgets_plus/rx_widgets_plus.dart';

import 'disclaimer.dart';
import 'visibility_selector.dart';

class RxListDisclaimer<T> extends StatelessWidget {
  final RxList<T> items;
  final String empty;
  final String full;

  const RxListDisclaimer({
    Key? key,
    required this.items,
    required this.empty,
    required this.full,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveBuilder(
      stream: items.onChange,
      initialData: items,
      builder: (context, _) => VisibilitySelector(
        selector: items.isEmpty,
        onTrue: SimpleSelector(
          Disclaimer(text: empty),
        ),
        onFalse: SimpleSelector(
          Disclaimer(text: full),
        ),
      ),
    );
  }
}
