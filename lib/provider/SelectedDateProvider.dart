import 'package:flutter/material.dart';

class SelectedDateProvider extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  String get dayOfWeek {
    return _selectedDate.weekday == DateTime.monday
        ? "Monday"
        : _selectedDate.weekday == DateTime.tuesday
        ? "Tuesday"
        : _selectedDate.weekday == DateTime.wednesday
        ? "Wednesday"
        : _selectedDate.weekday == DateTime.thursday
        ? "Thursday"
        : _selectedDate.weekday == DateTime.friday
        ? "Friday"
        : _selectedDate.weekday == DateTime.saturday
        ? "Saturday"
        : "Sunday";
  }

  String get dayAndDateFormatted {
    return "$dayOfWeek, ${_selectedDate.day}";
  }
}
