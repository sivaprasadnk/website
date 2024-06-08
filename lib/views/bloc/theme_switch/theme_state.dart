import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDarkTheme;
  const ThemeState({
    this.isDarkTheme = true,
  });

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDarkTheme: isDark ?? isDarkTheme);
  }

  @override
  List<Object?> get props => [isDarkTheme];
}
