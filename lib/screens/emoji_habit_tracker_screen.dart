import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cards/emoji_habit_card.dart';
import '../provider/SelectedDateProvider.dart';
import '../provider/habit_provider.dart';
import 'calorie_stats_screen.dart';

class EmojiHabitTrackerScreen extends StatefulWidget {
  const EmojiHabitTrackerScreen({super.key});

  @override
  State<EmojiHabitTrackerScreen> createState() => _EmojiHabitTrackerScreenState();
}

class _EmojiHabitTrackerScreenState extends State<EmojiHabitTrackerScreen> {
  int _selectedTabIndex = 0;

  void _onTabTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CalorieStatsScreen()),
      );
    } else {
      setState(() {
        _selectedTabIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);
    final selectedDateProvider = Provider.of<SelectedDateProvider>(context);
    final habits = habitProvider.habits;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.grid_view_outlined),
                  Text("Habit Tracker", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.calendar_today),
                ],
              ),
              const SizedBox(height: 16),

              // Notification Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Text("📚", style: TextStyle(fontSize: 30)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Now is the time to read the book, you can change it in settings.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Date Selector
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final now = DateTime.now();
                    final date = now.subtract(Duration(days: now.weekday - 1 - index));
                    final isSelected = selectedDateProvider.selectedDate.day == date.day &&
                        selectedDateProvider.selectedDate.month == date.month &&
                        selectedDateProvider.selectedDate.year == date.year;

                    return GestureDetector(
                      onTap: () {
                        selectedDateProvider.setSelectedDate(date);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              date.day.toString().padLeft(2, '0'),
                              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${selectedDateProvider.dayOfWeek} habit",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text("See all", style: TextStyle(color: Colors.orange)),
                ],
              ),
              const SizedBox(height: 12),

              // Habit Cards
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  habits.length,
                      (index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    child: EmojiHabitCard(index: index, habit: habits[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTabIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
