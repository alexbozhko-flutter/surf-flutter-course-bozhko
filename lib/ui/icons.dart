import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Картинка для пустого списка посещённых достопримечательностей
Image icoEmptyVisitedList = Image.asset(
  'res/images/visited_empty.png',
  width: 64.0,
  height: 64.0,
);

/// Картинка для пустого списка "Хочу посетить"
Image icoEmptyWantList = Image.asset(
  'res/images/visited_empty.png',
  width: 64.0,
  height: 64.0,
);

/// Иконка List от BottomNavigationBar, согласно макета
Image icoList = Image.asset(
  'res/images/icon_list.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка Map от BottomNavigationBar, согласно макета
Image icoMap = Image.asset(
  'res/images/icon_map.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка Heart от BottomNavigationBar, согласно макета
Image icoHeart = Image.asset(
  'res/images/icon_heart.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка Settings от BottomNavigationBar, согласно макета
Image icoSettings = Image.asset(
  'res/images/icon_settings.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка Share
Image icoShare = Image.asset(
  'res/images/share.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка Calendar
Image icoCalendar = Image.asset(
  'res/images/calendar.png',
  width: 24.0,
  height: 24.0,
);

/// Иконка-суффикс для поля поиска
Image icoSuffix = Image.asset(
  'res/images/suffix_icon.png',
  width: 24.0,
  height: 24.0,
);

// Задание 5.1

/// Иконка List от BottomNavigationBar, согласно макета
SvgPicture svgIcoList = SvgPicture.asset(
  'res/images/icon_list.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Map от BottomNavigationBar, согласно макета
SvgPicture svgIcoMap = SvgPicture.asset(
  'res/images/icon_map.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Heart от BottomNavigationBar, согласно макета
final Widget svgIcoHeart = SvgPicture.asset(
  'res/images/icon_heart.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Settings от BottomNavigationBar, согласно макета
SvgPicture svgIcoSettings = SvgPicture.asset(
  'res/images/icon_settings.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Heart от карты, согласно макета
SvgPicture svgIcoHeartTransp = SvgPicture.asset(
  'res/images/icon_heart_transp.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Cross от карты, согласно макета
SvgPicture svgIcoCross = SvgPicture.asset(
  'res/images/icon_cross.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Calendar от карты, согласно макета
SvgPicture svgIcoCalendar = SvgPicture.asset(
  'res/images/icon_calendar.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Calendar от карты, согласно макета
SvgPicture svgIcoShare = SvgPicture.asset(
  'res/images/icon_share.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка Arrow от карты, согласно макета
SvgPicture svgIcoArrow = SvgPicture.asset(
  'res/images/icon_arrow.svg',
  width: 24.0,
  height: 24.0,
);

/// ф-я возвращающая иконку Стрелка назад
// цвет передаётся в качестве параметра
Widget coloredIcoArrow(Color icoColor) {
  return SvgPicture.asset(
    'res/images/icon_arrow.svg',
    width: 24.0,
    height: 24.0,
    color: icoColor,
  );
}

/// Иконка Arrow от карты, согласно макета
SvgPicture svgIcoPath = SvgPicture.asset(
  'res/images/icon_path.svg',
  width: 24.0,
  height: 24.0,
);

/// Иконка для левой кнопки на экране sight_details
class SvgIcoCalendar extends StatelessWidget {
  // цвет проще передать параметром для реализации всяких эффектов
  final Color color;
  const SvgIcoCalendar({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'res/images/icon_calendar.svg',
      width: 24.0,
      height: 24.0,
      color: color,
    );
  }
}

/// Иконка для правой кнопки на экране sight_details
class SvgIcoHeart extends StatelessWidget {
  // цвет проще передать параметром для реализации всяких эффектов
  final Color color;
  const SvgIcoHeart.SvgIcoHeartTransp({Key key, this.color}) : super(key: key);

  @override

  /// Иконка Сердце не заштрихованое
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'res/images/icon_heart_transp.svg',
      width: 24.0,
      height: 24.0,
      color: color,
    );
  }
}

/// Иконка Отели, согласно макета
SvgPicture svgIcoHotel = SvgPicture.asset(
  'res/images/icon_hotel.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Рестораны, согласно макета
SvgPicture svgIcoRest = SvgPicture.asset(
  'res/images/icon_rest.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Особое место, согласно макета
SvgPicture svgIcoParticular = SvgPicture.asset(
  'res/images/icon_particular.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Парк, согласно макета
SvgPicture svgIcoPark = SvgPicture.asset(
  'res/images/icon_park.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Музей, согласно макета
SvgPicture svgIcoMuseum = SvgPicture.asset(
  'res/images/icon_museum.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Особое место от карты, согласно макета
SvgPicture svgIcoCafe = SvgPicture.asset(
  'res/images/icon_cafe.svg',
  width: 32.0,
  height: 32.0,
);

/// Иконка Особое место от карты, согласно макета
SvgPicture svgIcoInfo = SvgPicture.asset(
  'res/images/icon_info.svg',
  width: 24.0,
  height: 24.0,
);
