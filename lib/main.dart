import 'package:flutter/material.dart';
import 'app/app.dart';
import 'configuration/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const App());
}
