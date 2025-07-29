class DailyHabit {
  final String name;
  final String time;
  final String distance;
  final String imagePath;
  final bool isCompleted;

  DailyHabit({
    required this.name,
    required this.time,
    required this.distance,
    required this.imagePath,
    this.isCompleted = false,
  });
}
