import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDarkTheme;
  ThemeState({
    bool? isDarkTheme,
  }) : isDarkTheme = isDarkTheme ?? _getInitialTheme();

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDarkTheme: isDark ?? isDarkTheme);
  }

  @override
  List<Object?> get props => [isDarkTheme];

  static bool _getInitialTheme() {
    final now = DateTime.now();
    return now.hour < 12;
  }

}
