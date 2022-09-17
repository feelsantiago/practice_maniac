import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:practice_maniac/components/rounded_box.dart';

class EditableSlidableItem extends StatelessWidget {
  final Color color;
  final List<Widget> children;
  final void Function() onTap;
  final void Function() onEdit;
  final void Function() onRemove;

  const EditableSlidableItem({
    required Key key,
    required this.children,
    required this.onTap,
    required this.onRemove,
    required this.onEdit,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: true,
        openThreshold: 0.9,
        dismissible: DismissiblePane(
          dismissThreshold: 0.1,
          closeOnCancel: true,
          onDismissed: onRemove,
        ),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
            onPressed: (_) {
              onRemove();
            },
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: true,
        openThreshold: 0.9,
        dismissible: DismissiblePane(
          dismissThreshold: 0.1,
          confirmDismiss: () async {
            onEdit();
            return false;
          },
          closeOnCancel: true,
          onDismissed: () {},
        ),
        children: [
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.transparent,
            onPressed: (_) {
              onEdit;
            },
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: RoundedBox(
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
