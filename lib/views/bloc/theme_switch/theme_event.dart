abstract class ThemeEvent {
  ThemeEvent();
}

class ToggleTheme extends ThemeEvent {}

class UpdateColorTheme extends ThemeEvent {
  final int index;
  UpdateColorTheme({required this.index});
}
