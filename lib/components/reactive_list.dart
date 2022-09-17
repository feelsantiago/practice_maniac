import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:rx_widgets/rx_widgets.dart';

class ReactiveList<T> extends StatelessWidget {
  final RxList<T> items;
  final void Function()? onRefresh;
  final Iterable<Widget> Function(List<T> items) builder;

  const ReactiveList({
    Key? key,
    required this.items,
    required this.builder,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReactiveBuilder(
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
      ),
    );
  }
}
