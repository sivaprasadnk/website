import 'package:bloc/bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ToggleTheme>(_toggleTheme);
  }

  void _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    emit(state.copyWith(isDark: !state.isDarkTheme));
  }
}
