import 'package:flutter/material.dart';
import 'package:practice_maniac/components/card_title.dart';
import 'package:practice_maniac/components/color_card.dart';
import 'package:practice_maniac/components/editable_slidable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_item/practice_item_view_model.dart';

class PracticeItemView extends ViewData<Practice, PracticeItemViewModel> {
  final void Function() onChange;

  Practice get practice => viewModel.model.value;

  PracticeItemView({required Practice practice, required this.onChange})
      : super(key: Key(practice.id), model: practice);

  @override
  dynamic onInit() {
    listeners.sink = viewModel.remove.results.listen((_) => onChange());
  }

  @override
  Widget build(BuildContext context) {
    return EditableSlidable(
      key: ValueKey(practice),
      onEdit: viewModel.edit,
      onRemove: viewModel.remove,
      body: ColorCard(
        color: Color(practice.color),
        onTap: viewModel.detail,
        children: [
          CardTitle(practice.name),
        ],
      ),
    );
  }
}
