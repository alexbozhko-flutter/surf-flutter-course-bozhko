import 'package:places/domain/sight.dart';
import 'package:places/ui/captions.dart';

/// Коллекция достопримечательностей
final List<Sight> mocks = [
  // Думаю, так будет лучше
// final List mocks = [
  Sight(
      "Собор Успения Пресвятой Богородицы",
      49.99672819229528,
      36.2350256440369,
      "https://img.hotels24.ua/photos/ria/new_images/1023/102313/10231375/10231375m.jpg",
      "Успенский собор — один из старейших православных храмов Харькова. Пятый из двенадцати официальных символов города.",
      lblPart),
  Sight(
      "Стеклянная струя",
      49.99855601486035,
      36.234810520284384,
      "https://mykharkov.info/wp-content/uploads/2012/10/zerkalnaya_struya_3-700x495.jpg",
      "Беседка и фонтан в Харькове, первый символ города. Расположена по Сумской улице в сквере Победы, напротив впоследствии (в 1980-е годы) построенного нового здания Харьковского театра оперы и балета.",
      lblPark),
  Sight(
      "ХАТОБ",
      49.99911687307199,
      36.23258560680016,
      "https://internet-bilet.ua/images/room_header_photo/size3/hph_1487772738_58ad9c429f1db.jpg",
      "Театр оперы и балета",
      lblPart),
  Sight(
      "Кристалл",
      50.000241227014996,
      36.23075379279075,
      "https://lowcosttravel.club/wp-content/uploads/2020/05/kafe-Kristall.jpg",
      "Легендарное кафе «Кристалл» в самом сердце города. Это больше, чем ресторан – это страница истории Харькова.",
      lblCafe),

  Sight(
      "Дом Кофе",
      49.965249413369634,
      36.321118089863916,
      "https://p1.zoon.ru/preview/qWPCNT9RUowDpFFwnTc6kA/640x416x85/0/d/f/52414b6c40c0880f688b45a4_5243dc8073de9.jpg",
      "Мы предлагаем вам приобщиться к культуре эспрессопития вместе с Домом Кофе, который продает очень качественный и вкусный кофе и великолепное кофейное оборудование для его приготовления.",
      lblCafe),
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
