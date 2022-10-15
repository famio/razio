import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/app_text_style.dart';
import 'package:fudiko/ui/main/main_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudiko',
      theme: AppThemeData.light(),
      darkTheme: AppThemeData.dark(),
      home: const MainPage(),
    );
  }
}
