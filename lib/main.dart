import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'db/database.dart';
import 'theme/blind_dog_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await AppDatabase.instance.database;
  }
  runApp(const BlindDogApp());
}

class BlindDogApp extends StatelessWidget {
  const BlindDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blind Dog',
      theme: blindDogTheme(),
      home: const BlindDogShell(),
    );
  }
}

class BlindDogShell extends StatelessWidget {
  const BlindDogShell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Blind Dog'),
        ),
      ),
    );
  }
}
