import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';
import 'theme/theme_controller.dart';

import 'screens/auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: "AIzaSyDvr_-HiaL79_EVk5F51sIxelHiR3FCd4M",
      authDomain: "krishiai-32434.firebaseapp.com",
      projectId: "krishiai-32434",
      storageBucket: "krishiai-32434.firebasestorage.app",
      messagingSenderId: "374827311558",
      appId: "1:374827311558:web:a45ecb349415fac83152c7",
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const KrishiAIApp(),
    ),
  );
}

class KrishiAIApp extends StatelessWidget {
  const KrishiAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KrishiAI',

      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: themeController.themeMode,

      // 🔐 AUTHENTICATION ENTRY POINT
      home: const AuthGate(),
    );
  }
}
