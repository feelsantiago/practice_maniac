import 'package:flutter/material.dart';
import 'package:practice_maniac/app/practice_maniac_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view.dart';

class PracticeManiacView extends View<PracticeManiacViewModel> {
  PracticeManiacView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        fontFamily: 'HindMadurai',
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        canvasColor: Colors.black,
      ),
      home: PracticeListView(),
    );
  }
}
