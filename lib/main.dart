import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gql_app/injection_container.dart' as di;
import 'package:gql_app/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();

  runApp(App());
}