import 'package:flutter/material.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/styles.dart';

/// Светлая тема
final lightTheme = ThemeData(
  primaryColor: clLightMain,
  primaryColorDark: clDarkDark,
  scaffoldBackgroundColor: clLightWhite,
  backgroundColor: clLightBackground,
  bottomAppBarColor: clLightMain,
  shadowColor: clLightSecondary2,
  accentColor: clLightGreen,
  primarySwatch: lightPrimarySwatch,
  brightness: Brightness.light,
  accentColorBrightness: Brightness.light,
  bottomAppBarTheme: BottomAppBarTheme(
    color: clLightWhite,
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline1: visitingLight,
    ),
    color: clLightWhite,
    brightness: Brightness.light,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: clLightWhite,
    unselectedLabelColor: clLightInactiveBlack,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        40.0,
      ),
      color: clLightSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: InputDecorationLabelDark,
    hintStyle: InputDecorationHintDark,
    filled: true,
    fillColor: clLightBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
    ),
  ),
  accentIconTheme: IconThemeData( // Помечена как устаревшая,
    // пока оставил специально, чтобы почитать доку
    color: clLightGreen,
    size: 24,
  ),
  primaryTextTheme: TextTheme(
    caption: smallDetailLight,
    headline6: largeTitleLight,
    headline5: smallBoldLight,
    headline4: TitleLight,
    headline3: inactiveBlack,
    headline2: inactiveBlackSmall,
    bodyText1: textLight,
    bodyText2: smallLight,
    subtitle1: smallSubtitleLight,
  ),
);

/// Тёмная тема
final darkTheme = ThemeData(
  primaryColor: clDarkWhite,
  primaryColorDark: clDarkWhite,
  backgroundColor: clDarkDark,
  scaffoldBackgroundColor: clDarkMain,
  shadowColor: clDarkInactiveBlack,
  primarySwatch: darkPrimarySwatch,
  accentColor: clDarkGreen,
  brightness: Brightness.dark,
  accentColorBrightness: Brightness.light,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline1: visitingDark,
    ),
    color: clDarkMain,
    brightness: Brightness.dark,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: clDarkSecondary,
    unselectedLabelColor: clDarkSecondary2,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        40.0,
      ),
      color: clDarkWhite,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: clDarkWhite,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: InputDecorationLabelDark,
    hintStyle: InputDecorationHintDark,
    filled: true,
    fillColor: clDarkDark,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
    ),
  ),
  accentIconTheme: IconThemeData(
    color: clDarkGreen,
    size: 24,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: clDarkMain,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: clDarkWhite,
    unselectedItemColor: clDarkWhite,
    selectedIconTheme: IconThemeData(
      color: clDarkWhite,
      opacity: 1.0,
      size: 20.0,
    ),
    unselectedIconTheme: IconThemeData(
      color: clDarkWhite,
      opacity: 1.0,
      size: 20.0,
    ),
    type: BottomNavigationBarType.fixed,
  ),
  primaryTextTheme: TextTheme(
    caption: smallDetailDark,
    headline4: TitleDark,
    headline5: smallBoldDark,
    headline6: largeTitleDark,
    headline3: inactiveBlack,
    headline2: inactiveBlackSmall,
    bodyText1: textDark,
    bodyText2: smallDark,
    subtitle1: smallSubtitleDark,
  ),
);

enum ThemeType { Light, Dark }
/// Нотификатор для смены темы
class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType _themeType = ThemeType.Light;

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      return notifyListeners();
    }

    if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      return notifyListeners();
    }
  }
}