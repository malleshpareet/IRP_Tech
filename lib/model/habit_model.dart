class Habit {
  final String name;
  final String emoji;
  bool isSelected;

  Habit({
    required this.name,
    required this.emoji,
    this.isSelected = false,
  });
}
