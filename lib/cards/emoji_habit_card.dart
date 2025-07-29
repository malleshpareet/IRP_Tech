import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/habit_model.dart';
import '../provider/habit_provider.dart';

class EmojiHabitCard extends StatelessWidget {
  final int index;
  final Habit habit;

  const EmojiHabitCard({super.key, required this.index, required this.habit});

  @override
  Widget build(BuildContext context) {
    final isCompleted = habit.isSelected;

    // Time & Distance logic (customize here per habit)
    String habitTime = "";
    if (habit.name == "Bicycle") {
      habitTime = "07:00 AM for 10km";
    } else if (habit.name == "Running") {
      habitTime = "12:00 PM for 5km";
    } else if (habit.name == "Reading") {
      habitTime = "09:00 AM for 30min";
    } else {
      habitTime = "05:00 PM for 15min";
    }

    return GestureDetector(
      onTap: () {
        Provider.of<HabitProvider>(context, listen: false).toggleHabit(index);
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isCompleted ? Colors.orange.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.check_circle,
                color: isCompleted ? Colors.orange : Colors.grey.shade300,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            Center(child: Text(habit.emoji, style: const TextStyle(fontSize: 32))),
            const SizedBox(height: 10),
            Center(
              child: Text(
                habit.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                habitTime,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
