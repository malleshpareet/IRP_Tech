import 'package:flutter/material.dart';
import '../model/habit_model.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [
    Habit(name: 'Work Out', emoji: '🏃‍♂️'),
    Habit(name: 'Eat Food', emoji: '🍔'),
    Habit(name: 'Music', emoji: '🎤'),
    Habit(name: 'Art & Design', emoji: '🎨'),
    Habit(name: 'Traveling', emoji: '🧳'),
    Habit(name: 'Read Book', emoji: '📚'),
    Habit(name: 'Gaming', emoji: '🎮'),
    Habit(name: 'Mechanic', emoji: '🛠️'),
  ];

  List<Habit> get habits => _habits;

  void toggleHabit(int index) {
    _habits[index].isSelected = !_habits[index].isSelected;
    notifyListeners();
  }
}
