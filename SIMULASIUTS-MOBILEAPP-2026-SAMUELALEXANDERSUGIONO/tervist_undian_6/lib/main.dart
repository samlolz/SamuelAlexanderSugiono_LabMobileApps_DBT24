import 'package:flutter/material.dart';
import 'pages/workout_page.dart';

void main() {
  runApp(const TervistApp());
}

class TervistApp extends StatelessWidget {
  const TervistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tervist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1DB954)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const WorkoutPage(),
    );
  }
}