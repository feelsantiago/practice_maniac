import 'package:flutter/material.dart';
import 'package:practice_maniac/app/practice_maniac_view.dart';

import 'infra/configuration/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(PracticeManiacView());
}
