

class PomoSettings {
  final int pomodoroLength;
  final int longBreakLength;
  final int shortBreakLength;
  final int longBreakAfter;
  final bool autoPomodoro;
  final bool autoBreak;
  final bool disableBreak;
  PomoSettings(
  {
    required this.pomodoroLength,
    required this.longBreakLength,
    required this.shortBreakLength,
    required this.longBreakAfter,
    required this.autoPomodoro,
    required this.autoBreak,
    required this.disableBreak});

  Map<String, dynamic> toMap(){
    return {
      'pomodoroLength': pomodoroLength,
      'longBreakLength': longBreakLength,
      'shortBreakLength': shortBreakLength,
      'longBreakAfter': longBreakAfter,
      'autoPomodoro': autoPomodoro,
      'autoBreak': autoBreak,
      'disableBreak': disableBreak
    };
  }
  PomoSettings.fromMap(Map<String, dynamic> addressMap)
      : pomodoroLength = addressMap["pomodoroLength"],
        longBreakLength = addressMap["longBreakLength"],
        shortBreakLength = addressMap["shortBreakLength"],
        longBreakAfter = addressMap["longBreakAfter"],
        autoPomodoro = addressMap["autoPomodoro"],
        autoBreak = addressMap["autoBreak"],
        disableBreak = addressMap["disableBreak"];
}