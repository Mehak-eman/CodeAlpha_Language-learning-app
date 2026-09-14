import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'firebase_options.dart';
import 'providers/progress_provider.dart';
import 'screens/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
  ChangeNotifierProvider(
  create: (_) => ProgressProvider()..loadProgress(),
  child: const LingoLearnApp(),
),
  );
}

class LingoLearnApp extends StatelessWidget {
  const LingoLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LingoLearn',
      theme: AppTheme.lightTheme,
      home: const AuthWrapper(),
    );
  }
}