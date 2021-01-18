
import 'package:flutter/material.dart';

TextStyle largeTitle = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 32.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);

TextStyle stylesightName = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 16.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль Категория достопримечательности
TextStyle styleSightType = TextStyle(
  color: Color(0xffFFFFFF), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль Категория достопримечательности
TextStyle styleSightDetails = TextStyle(
  color: Color(0xff7C7E92), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);