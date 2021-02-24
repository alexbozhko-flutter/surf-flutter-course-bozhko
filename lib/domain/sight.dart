/// Модель данных Sight
class Sight {
  /// название
  String name;

  /// широта
  double lat;

  /// долгота
  double lon;

  /// ссылка
  String url;

  /// описание
  String details;

  /// тип достопримечательности
  String
      type; // Скорее всего, он будет целочисленный, но пока таблицы типов нет

  Sight(this.name, this.lat, this.lon, this.url, this.details, this.type);
}
