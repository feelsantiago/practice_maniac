import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/practice/practice_create/practice_create_view_model.dart';

class PracticeCreateView extends ViewData<Practice, PracticeCreateViewModel> {
  PracticeCreateView({Key? key}) : super(key: key, model: Practice.empty());

  @override
  Widget build(BuildContext context) {
    print('test');
    return const Text('Practice Form Create');
  }
}
