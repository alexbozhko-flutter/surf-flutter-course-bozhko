import 'package:places/domain/sight.dart';

/// Коллекция достопримечательностей
 final List<Sight> mocks = [ // Думаю, так будет лучше
// final List mocks = [
  Sight(
      "Собор Успения Пресвятой Богородицы",
      49.1794452,
      36.1593532,
      "https://img.hotels24.ua/photos/ria/new_images/1023/102313/10231375/10231375m.jpg",
      "Успенский собор — один из старейших православных храмов Харькова. Пятый из двенадцати официальных символов города.",
      "Храм"),
  Sight(
      "Стеклянная струя",
      49.998694,
      36.234583,
      "https://mykharkov.info/wp-content/uploads/2012/10/zerkalnaya_struya_3-700x495.jpg",
      "Беседка и фонтан в Харькове, первый символ города. Расположена по Сумской улице в сквере Победы, напротив впоследствии (в 1980-е годы) построенного нового здания Харьковского театра оперы и балета.",
      "Фонтан"),
  Sight(
      "ХАТОБ",
      49.998694,
      36.234583,
      "https://internet-bilet.ua/images/room_header_photo/size3/hph_1487772738_58ad9c429f1db.jpg",
      "Театр оперы и балета",
      "Театр"),
];

 /// Моковые данные для VisitedCard

// можно натыкать побольше, чтобы не заморачиваться проверками длины списка в
// процессе разработки. Всё-равно реальные данные будут организованы иначе
final List<String> mocksVisitedCaptions = [
 "Цель достигнута 12 окт. 2020",
 "Цель достигнута 13 окт. 2020",
 "Цель достигнута 14 окт. 2020",
 "Цель достигнута 15 окт. 2020",
];


/// Моковые данные для VisitedCard

// можно натыкать побольше, чтобы не заморачиваться проверками длины списка в
// процессе разработки. Всё-равно реальные данные будут организованы иначе
final List<String> mocksPlanedCaptions = [
 "Запланировано на 12 окт. 2020",
 "Запланировано на 13 окт. 2020",
 "Запланировано на 14 окт. 2020",
 "Запланировано на 15 окт. 2020",
];