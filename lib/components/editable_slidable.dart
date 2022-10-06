import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EditableSlidable extends StatelessWidget {
  final Widget body;
  final void Function() onEdit;
  final void Function() onRemove;

  const EditableSlidable({
    required Key key,
    required this.onRemove,
    required this.onEdit,
    required this.body,
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
      child: body,
    );
  }
}
