// Flutter code sample for material.FloatingActionButton.2

// This example shows how to make an extended [FloatingActionButton] in a
// [Scaffold], with a  pink [backgroundColor] and a thumbs up [Icon] and a
// [Text] label.

import 'package:flutter/material.dart';
import 'package:test_webland/layer/creategoal/CreateGoalScreen.dart';
import 'package:test_webland/layer/goalslist/GoalsListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      routes: {
        "/": (context) => GoalsListScreen(),
        GoalsListScreen.route: (context) => GoalsListScreen(),
        CreateGoalScreen.route: (context) => CreateGoalScreen(),
      },
    );
  }
}