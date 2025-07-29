import 'package:flutter/material.dart';
import 'package:hello/provider/SelectedDateProvider.dart';

import 'package:hello/provider/habit_provider.dart';
import 'package:hello/screens/emoji_habit_tracker_screen.dart';

import 'package:provider/provider.dart';

import 'screens/choose_habit_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HabitProvider()),
        ChangeNotifierProvider(create: (_) => SelectedDateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Habit',
      debugShowCheckedModeBanner: false,
      home: ChooseHabitScreen(),
    );
  }
}
