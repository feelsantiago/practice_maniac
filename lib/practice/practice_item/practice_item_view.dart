import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_item/practice_item_view_model.dart';

class PracticeItemView extends ViewData<Practice, PracticeItemViewModel> {
  Practice get practice => viewModel.model.value;

  PracticeItemView({Key? key, required Practice practice})
      : super(key: key, model: practice);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(practice.color),
      ),
      child: Text(practice.name),
    );
  }
}
