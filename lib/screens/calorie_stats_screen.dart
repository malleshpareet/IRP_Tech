import 'package:flutter/material.dart';
import 'emoji_habit_tracker_screen.dart'; // Make sure this file exists and is correctly imported

class CalorieStatsScreen extends StatelessWidget {
  const CalorieStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final analyticsCardSize = screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.grid_view_rounded, size: 24),
                  Text(
                    'Calorie stats',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.calendar_today, size: 20),
                ],
              ),
              const SizedBox(height: 20),

              // Analytics Card
              Container(
                width: analyticsCardSize,
                height: analyticsCardSize,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Analytics", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    const Text("7,830 Calls", style: TextStyle(color: Colors.orange, fontSize: 13)),
                    const SizedBox(height: 12),

                    // Graph
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            7,
                                (index) => Container(
                              width: 16,
                              height: index == 3 ? 80 : 45 + (index % 3) * 10,
                              decoration: BoxDecoration(
                                color: index == 3 ? Colors.orange : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Burn Info
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black.withOpacity(0.05),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.local_fire_department, color: Colors.orange, size: 18),
                            SizedBox(width: 4),
                            Text("Burn", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Text("535 Calls", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Challenge Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Challenge", style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),

              // Challenge List
              Column(
                children: const [
                  _ChallengeItem(
                    icon: Icons.pool,
                    title: "Swimming in the sea",
                    status: "Completed!",
                    statusColor: Colors.green,
                    calories: "322 calls",
                  ),
                  _ChallengeItem(
                    icon: Icons.directions_run,
                    title: "Run 4 laps in court",
                    status: "Completed!",
                    statusColor: Colors.green,
                    calories: "420 calls",
                  ),
                  _ChallengeItem(
                    icon: Icons.self_improvement,
                    title: "Yoga at 10.00pm",
                    status: "Not Started!",
                    statusColor: Colors.red,
                    calories: "200 calls",
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const EmojiHabitTrackerScreen()),
            );
          }
          // You can add logic for index 2 and 3 if needed
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _ChallengeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String status;
  final Color statusColor;
  final String calories;

  const _ChallengeItem({
    required this.icon,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey.shade100,
        child: Icon(icon, size: 22, color: Colors.orange),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      subtitle: Text(
        status,
        style: TextStyle(fontSize: 12.5, color: statusColor),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.local_fire_department, color: Colors.orange, size: 18),
          const SizedBox(height: 4),
          Text(calories, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
