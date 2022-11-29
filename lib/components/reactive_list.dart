import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/utils/fit_strategy.dart';
import 'package:rx_widgets_plus/rx_widgets_plus.dart';

class ReactiveList<T> extends StatelessWidget {
  final RxList<T> items;
  final FitStrategy fit;
  final void Function()? onRefresh;
  final Iterable<Widget> Function(List<T> items) builder;

  const ReactiveList({
    Key? key,
    required this.items,
    required this.builder,
    this.onRefresh,
    this.fit = const ExpandToFit(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = ReactiveBuilder(
      stream: items.onChange,
      initialData: items,
      builder: (context, _) {
        return RefreshIndicator(
          onRefresh: () async => onRefresh?.call(),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  builder(items).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );

    return fit.wrapper(content);
  }
}
