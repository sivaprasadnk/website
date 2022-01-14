import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.green),
        fillColor: MaterialStateProperty.all(
            isDarkTheme ? Colors.white : Colors.green),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        caption: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: isDarkTheme ? Colors.white : Colors.black),
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'SansitaSwashed',
          color: Colors.black,
          fontSize: 30,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        // share popup menu btn
        headline3: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(
            fillColor: Colors.blue,
            transitionType: SharedAxisTransitionType.horizontal,
          )
        },
      ),
      iconTheme:
          IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
      primarySwatch: Colors.teal,
      primaryColor: isDarkTheme ? Colors.black : Colors.teal,
      // text
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      // backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // checkboxThem,

      // canvasColor: isDarkTheme ? Colors.grey : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        // color: isDarkTheme ? Colors.white : Colors.black,
        iconTheme: IconThemeData(color: Colors.blue),
        // textTheme: TextTheme(
        //     bodyText1:
        //         TextStyle(color: isDarkTheme ? Colors.white : Colors.black)),
        // actionsIconTheme: ,
        elevation: 0.0,
      ),
    );
  }
}
