import 'package:flutter/material.dart';
import 'package:practice_maniac/app/practice_maniac_view_model.dart';
import 'package:practice_maniac/packages/mvvm/view.dart';
import 'package:practice_maniac/tracker/tracker_list/tracker_list_view.dart';

class PracticeManiacView extends View<PracticeManiacViewModel> {
  PracticeManiacView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: TrackerListView(),
      ),
    );
  }
}
