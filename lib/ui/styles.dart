
import 'package:flutter/material.dart';

/// стиль для главной надписи в пустом списке
TextStyle emptyListLarge = TextStyle(
  color: Color(0xff7C7E92), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 18.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

/// стиль для доп надписи в пустом списке
TextStyle emptyListSmall = TextStyle(
  color: Color(0xff7C7E92), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

TextStyle largeTitle = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 32.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);

/// стиль табов
TextStyle visitingTab = TextStyle(
  // color: Colors.white, //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 18.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);


TextStyle visitingTitle = TextStyle(
  color: Color(0xff252849), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 18.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

TextStyle styleSightName = TextStyle(
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

/// Текстовый стиль детализация достопримечательности
TextStyle styleSightDetails = TextStyle(
  color: Color(0xff7C7E92), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль для отобр. запланированых посещений достопримечательностей
TextStyle stylePlaned = TextStyle(
  color: Color(0xff4CAF50), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль названия достопримечательности для экрана детализации
TextStyle styleSightNameScrDetail = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 24.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль описания достопримечательности для экрана детализации
TextStyle styleSightDetailsScrDetail = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль типа достопримечательности для экрана детализации
TextStyle styleSightTypeScrDetail = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);

/// Текстовый стиль доп. информации о достопримечательности для экрана детализации
TextStyle styleSightSubTypeScrDetail = TextStyle(
  color: Color(0xff7C7E92), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 14.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);