import 'package:flutter/material.dart';
import 'package:practice_maniac/components/rounded_box.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_item/practice_item_view_model.dart';

class PracticeItemView extends ViewData<Practice, PracticeItemViewModel> {
  Practice get practice => viewModel.model.value;

  PracticeItemView({required Practice practice})
      : super(key: Key(practice.id), model: practice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RoundedBox(
        color: practice.paint(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      practice.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(2, 2),
            blurRadius: 0.5,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
