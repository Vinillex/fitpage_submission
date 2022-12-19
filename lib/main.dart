import 'dart:async';

import 'package:fitpage_submission/utility/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  registerDependencies();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
