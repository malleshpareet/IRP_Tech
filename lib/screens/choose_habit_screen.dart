import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/habit_provider.dart';
import '../screens/emoji_habit_tracker_screen.dart'; // Adjust path if needed

class ChooseHabitScreen extends StatelessWidget {
  const ChooseHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose habit",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Choose your daily habits, you can choose more than one",
                style: TextStyle(fontSize: 13.5, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Habit Grid
              Expanded(
                child: GridView.builder(
                  itemCount: habitProvider.habits.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    final habit = habitProvider.habits[index];
                    return GestureDetector(
                      onTap: () => habitProvider.toggleHabit(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: habit.isSelected
                                ? Colors.orange
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 4,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              habit.emoji,
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              habit.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Get Started Button
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final selected = habitProvider.habits
                        .where((habit) => habit.isSelected)
                        .map((e) => e.name)
                        .toList();

                    debugPrint("Selected Habits: $selected");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const EmojiHabitTrackerScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Get Started!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
