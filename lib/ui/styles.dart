import 'package:flutter/material.dart';
import 'package:places/ui/app_colors.dart';

/// Базовый TextStyle для обоих тем
const TextStyle _text = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
);

/// Текстовые стили с наименованием в формате <название><тема>,
/// где Название - наименование близкое к наименованию в макете
/// Тема - светлая или темная тема

// Если наименование темы отсутствует,  - стиль используется в обеих темах

TextStyle largeTitleDark = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: clDarkWhite,
);
// Необходимо будет проверить
TextStyle largeTitleLight = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: clLightMain,
);

TextStyle TitleDark = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: clDarkWhite,
);

TextStyle TitleLight = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: clLightMain,
);

TextStyle smallBoldDark = _text.copyWith(
  fontSize: 14,
  color: clDarkWhite,
  fontWeight: FontWeight.bold,
);

TextStyle smallBoldLight = _text.copyWith(
  fontSize: 14,
  color: clLightWhite,
  fontWeight: FontWeight.w700,
);

TextStyle smallSubtitleDark = _text.copyWith(
  fontSize: 14,
  color: clDarkSecondary2,
  fontWeight: FontWeight.w700,
);

TextStyle smallSubtitleLight = _text.copyWith(
  fontSize: 14,
  color: clLightSecondary,
  fontWeight: FontWeight.bold,
);

TextStyle textDark = _text.copyWith(
  fontSize: 16,
  color: clDarkWhite,
  fontWeight: FontWeight.w500,
);

TextStyle textLight = _text.copyWith(
  fontSize: 16,
  color: clLightSecondary,
  fontWeight: FontWeight.w500,
);

TextStyle smallDark = _text.copyWith(
  fontSize: 14,
  color: clDarkSecondary2,
  fontWeight: FontWeight.w400,
);

TextStyle smallLight = _text.copyWith(
  fontSize: 14,
  color: clLightSecondary2,
  fontWeight: FontWeight.w400,
);

TextStyle Dark = _text.copyWith(
  fontSize: 16,
  color: clLightWhite,
  fontWeight: FontWeight.w500,
);

/// стиль для Зеленой надписи на белой кнопке
TextStyle textButtonGreen = _text.copyWith(
  fontSize: 16,
  color: clDarkGreen,
  fontWeight: FontWeight.w500,
);

TextStyle InputDecorationHintLight = _text.copyWith(
  fontSize: 14,
  color: clLightSecondary2,
  fontWeight: FontWeight.w400,
);

TextStyle InputDecorationHintDark = _text.copyWith(
  fontSize: 14,
  color: clLightSecondary2,
  fontWeight: FontWeight.w400,
);

TextStyle InputDecorationLabelLight = _text.copyWith(
  fontSize: 14,
  color: clLightWhite,
  fontWeight: FontWeight.w400,
);

TextStyle InputDecorationLabelDark = _text.copyWith(
  fontSize: 14,
  color: clDarkWhite,
  fontWeight: FontWeight.w400,
);

/// Текстовый стиль детализация достопримечательности светл.
TextStyle smallDetailLight = _text.copyWith(
  fontSize: 14,
  color: clLightSecondary,
  fontWeight: FontWeight.w400,
);

/// Текстовый стиль детализация достопримечательности тёмн.
TextStyle smallDetailDark = _text.copyWith(
  fontSize: 14,
  color: clDarkWhite,
  fontWeight: FontWeight.w400,
);

/// Текстовый стиль заголовка на экране фильтра (Расстояние)
TextStyle smallDetailLightMain = _text.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: clLightMain,
);

TextStyle smallDetailDarkMain = _text.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: clDarkWhite,
);

/// Текстовый стиль для заголовков
TextStyle fieldTitleCommon = _text.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

/// стили табов
TextStyle visitingDark = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

TextStyle visitingLight = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  color: clLightMain,
);

/// стиль для главной надписи в пустом списке
TextStyle inactiveBlackLight = TextStyle(
  color: clDarkSecondary2, //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

/// стиль для главной надписи в пустом списке
// Един для светлой и темной
TextStyle inactiveBlack = TextStyle(
  color: clDarkSecondary2, //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

/// стиль для доп. надписи в пустом списке
// Един для светлой и темной
TextStyle inactiveBlackSmall = inactiveBlack.copyWith(
  fontSize: 14,
);
