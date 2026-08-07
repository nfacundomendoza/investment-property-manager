import 'package:flutter/material.dart';
import '../screens/main_screen.dart';
import 'theme.dart';

class FlipTrackerApp extends StatelessWidget {
  const FlipTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flip Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}