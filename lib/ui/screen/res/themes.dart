import 'package:flutter/material.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/styles.dart';

/// Светлая тема
final lightTheme = ThemeData(
  errorColor: clLightRed,
  hintColor: clFieldCaptionColor,
  buttonColor: clLightWhite,
  disabledColor: clLightWhite,
  primaryColor: clLightMain,
  primaryColorDark: clDarkDark,
  primaryColorLight: clLightWhite,
  scaffoldBackgroundColor: clLightWhite,
  backgroundColor: clLightBackground,
  bottomAppBarColor: clLightMain,
  shadowColor: clLightSecondary2,
  accentColor: clLightGreen,
  dividerColor: clLightGreenTranspanent,
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
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: clLightMain,
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
    // fillColor: clLightWhite,
    filled: false,

    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: clLightGreenBorder, width: 1.0),
      gapPadding: 2,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: clLightGreenBorder, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: clLightGreenBorder,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  accentIconTheme: IconThemeData(
    // Помечена как устаревшая,
    // пока оставил специально, чтобы почитать доку
    color: clLightGreen,
    size: 24,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: clLightWhite,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: clLightWhite,
    unselectedItemColor: clLightWhite,
    selectedIconTheme: IconThemeData(
      color: clLightWhite,
      opacity: 1.0,
      size: 20.0,
    ),
    unselectedIconTheme: IconThemeData(
      color: clLightWhite,
      opacity: 1.0,
      size: 20.0,
    ),
    type: BottomNavigationBarType.fixed,
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
    button: smallBoldDark,
  ),
  textTheme: TextTheme(
    button: textButtonGreen,
    headline1: smallDetailLightMain,
    subtitle1: fieldTitleCommon.copyWith(
      color: clFieldCaptionColor,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: clLightWhite,
    textTheme: ButtonTextTheme.accent,
  ),
);

/// Тёмная тема
final darkTheme = ThemeData(
  errorColor: clDarkRed,
  hintColor: clTabBarColorTransparent, //!!! поменять!
  buttonColor: clDarkMain,
  disabledColor: clDarkSecondary2,
  primaryColor: clDarkWhite,
  primaryColorDark: clDarkWhite,
  primaryColorLight: clDarkWhite,
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
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: clLightMain,
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
    button: smallBoldDark,
  ),
  textTheme: TextTheme(
    button: textButtonGreen,
    headline1: smallDetailDarkMain, //!
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: clDarkMain,
    textTheme: ButtonTextTheme.accent,
  ),
);

enum ThemeType { Light, Dark }

/// Нотификатор для смены темы
class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  // Для быстрой смены дефолтной темы
  // ThemeData currentTheme = darkTheme;

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
