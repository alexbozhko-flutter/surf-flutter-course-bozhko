import 'package:flutter/material.dart';

/// цветовые константы, которые используются в приложении

// Думаю, имеет смысл в дальнейшем переделать в класс, по аналогии с Colors

const clInactiveGrey = Color(0xFFF5F5F5);
const clGreenCaption = Color(0xFF4CAF50);
const clIndicatorColor = Color(0xFF3B3E5B);
const clTabBarColor = Color(0xFF7C7E92);
const clTabBarColorTransparent = Color(0x407C7E92);

/// Light Theme Colors
const clLightBackground = Color(0xFFF5F5F5);
const clLightGreen = Color(0xFF4CAF50);
const clLightGreenTranspanent = Color(0x104CAF50);
const clLightYellow = Color(0xFFFCDD3D);
const clLightRed = Color(0xFFEF4343);
const clLightMain = Color(0xFF252849);
const clLightSecondary = Color(0xFF3B3E5B);
const clLightSecondary2 = Color(0xFF7C7E92);
const clLightInactiveBlack = Color.fromRGBO(
  124,
  126,
  146,
  0.56,
);
const clLightWhite = Color(0xFFFFFFFF);

/// Dark Theme Colors
const clDarkGreen = Color(0xFF6ADA6F);
const clDarkYellow = Color(0xFFFFE769);
const clDarkRed = Color(0xFFCF2A2A);
const clDarkDark = Color(0xFF1A1A20);
const clDarkMain = Color(0xFF21222C);
const clDarkSecondary = Color(0xFF3B3E5B);
const clDarkSecondary2 = Color(0x907C7E92);
const clDarkInactiveBlack = Color.fromRGBO(
  124,
  126,
  146,
  0.56,
);
const clDarkWhite = Color(0xFFFFFFFF);

// цвет для заглушек, который хорошо видно
const clMockContrast = Color(0xFF801E48);

Map<int, Color> darkGradient = {
  50: Color.fromRGBO(124, 126, 146, .1),
  100: Color.fromRGBO(124, 126, 146, .2),
  200: Color.fromRGBO(124, 126, 146, .3),
  300: Color.fromRGBO(124, 126, 146, .4),
  400: Color.fromRGBO(124, 126, 146, .5),
  500: Color.fromRGBO(124, 126, 146, .6),
  600: Color.fromRGBO(124, 126, 146, .7),
  700: Color.fromRGBO(124, 126, 146, .8),
  800: Color.fromRGBO(124, 126, 146, .9),
  900: Color.fromRGBO(124, 126, 146, 1),
};

MaterialColor darkPrimarySwatch = MaterialColor(0xFF1A1A20, darkGradient);

Map<int, Color> lightGradient = {
  50: Color.fromRGBO(124, 126, 146, .1),
  100: Color.fromRGBO(124, 126, 146, .2),
  200: Color.fromRGBO(124, 126, 146, .3),
  300: Color.fromRGBO(124, 126, 146, .4),
  400: Color.fromRGBO(124, 126, 146, .5),
  500: Color.fromRGBO(124, 126, 146, .6),
  600: Color.fromRGBO(124, 126, 146, .7),
  700: Color.fromRGBO(124, 126, 146, .8),
  800: Color.fromRGBO(124, 126, 146, .9),
  900: Color.fromRGBO(124, 126, 146, 1),
};

MaterialColor lightPrimarySwatch = MaterialColor(0xFF4CAF50, lightGradient);
