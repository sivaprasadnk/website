import 'package:bloc/bloc.dart';
import 'package:spnk/views/bloc/theme_switch/theme_event.dart';
import 'package:spnk/views/bloc/theme_switch/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ToggleTheme>(_toggleTheme);
    // on<GetColorTheme>(_getColorTheme);s
    on<UpdateColorTheme>(_updateColorTheme);
  }

  void _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    emit(state.copyWith(isDark: !state.isDarkTheme));
  }
  void _updateColorTheme(UpdateColorTheme event, Emitter<ThemeState> emit) {
    emit(state.copyWith(index: event.index));
  }

  // ThemeData _getColorTheme(
  //   GetColorTheme event,
  //   Emitter<ThemeState> emit,
  // ) {
  //   final index = event.index;
  //   final isDarkTheme = state.isDarkTheme;
  //   // var darkColor = isDarkTheme ? lightColorList[index] : darkColorList[index];
  //   // var lightColor = !isDarkTheme ? lightColorList[index] : darkColorList[index];
  //   return ThemeData(
  //     appBarTheme: AppBarTheme(
  //       backgroundColor:
  //           !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //     ),
  //     brightness: Brightness.light,
  //     // drawerTheme: const DrawerThemeData(
  //     //   backgroundColor: Color.fromRGBO(239, 239, 239, 1),
  //     // ),
  //     primaryColor: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //     hoverColor: isDarkTheme ? lightColorList[index] : darkColorList[index],
  //     scaffoldBackgroundColor:
  //         !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //     scrollbarTheme: const ScrollbarThemeData().copyWith(
  //       thumbVisibility: const WidgetStatePropertyAll(false),
  //       thumbColor: WidgetStateProperty.all(
  //         isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //     ),
  //     shadowColor: Colors.black.withOpacity(0.2),
  //     splashColor: const Color(0xFF002278),
  //     textTheme: TextTheme(
  //       bodyLarge: TextStyle(
  //         fontSize: 21,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       bodyMedium: TextStyle(
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       bodySmall: TextStyle(
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       displayLarge: TextStyle(
  //         fontSize: 50,
  //         fontFamily: 'Zina',
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       displayMedium: TextStyle(
  //         fontSize: 30,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       displaySmall: TextStyle(
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       headlineSmall: TextStyle(
  //         fontSize: 50,
  //         fontFamily: 'Zina',
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //       titleLarge: TextStyle(
  //         fontSize: 35,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: kRajdhaniFontFamily,
  //         color: !isDarkTheme ? lightColorList[index] : darkColorList[index],
  //       ),
  //     ),
  //   );
  // }
}
