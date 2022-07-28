import 'package:flutter/material.dart';
import 'package:practice_maniac/tracker/tracker_list/tracker_list_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
