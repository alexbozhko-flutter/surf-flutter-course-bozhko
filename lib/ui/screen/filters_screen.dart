import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

/// экран фильтра
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  /// моковые координаты текущего местонахождения
  double mockLat = 49.957778;
  double mockLon = 36.334573;

  /// RangeValues для слайдера
  var filteredRange = RangeValues(100, 10000);

  /// Список булевских значений для хранения состояния кнопок (чекбоксов)
  List<bool> filterCheckValues = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  /// ф-я, возвращающая индекс категории, соответствующий индексу
  /// в списке filterCheckValues
  int indexByCategory(String categoy) {
    switch (categoy) {
      case lblHotels:
        return 0;
        break;
      case lblRest:
        return 1;
        break;
      case lblPart:
        return 2;
        break;
      case lblPark:
        return 3;
        break;
      case lblMuseum:
        return 4;
        break;
      case lblCafe:
        return 5;
        break;
      default:
        return 0;
    }
  }

  /// ф-я возвращающая список достопримечательностей, попадающих под фильтр
  List<Sight> getFilteredSights() {
    List<Sight> resultList = [];
    bool inRadius = false;
    bool categoryChecked = false;

    for (var i = 0; i < mocks.length; i++) {
      double _dist = getDistance(
        latSihgt: mocks[i].lat,
        lonSight: mocks[i].lon,
      );
      inRadius = (_dist >= filteredRange.start / 1000) &
          (_dist <= filteredRange.end / 1000);

      if (inRadius) {
        // Пока отображаем так ;)
        categoryChecked = filterCheckValues[indexByCategory(mocks[i].type)];
        if (categoryChecked) {
          print(mocks[i].name);
          print('dist: $_dist');
          resultList.add(mocks[i]);
        }
      }
    }

    return resultList;
  }

  /// обработчик нажатия кнопки -филтра
  void _filterButtonPressed(int index) {
    setState(
      () {
        filterCheckValues[index] = !filterCheckValues[index];
        getFilteredSights();
      },
    );
  }

  /// Виджет чекбокс для кнопки
  Widget filteredCheckBox(int index) {
    if (filterCheckValues[index]) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Checkbox(
          value: filterCheckValues[index],
          onChanged: (state) => setState(
              () => filterCheckValues[index] = !filterCheckValues[index]),
          activeColor: Colors.transparent,
          checkColor: Theme.of(context).scaffoldBackgroundColor,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      );
    } else
      return null;
  }

  /// SVG-иконка для кнопки, соответствующая категории, порядковый номер которой
  /// передаётся в качестве параметра
  Widget getCategoryIcon(int index) {
    switch (index) {
      case 0:
        return svgIcoHotel;
        break;
      case 1:
        return svgIcoRest;
        break;
      case 2:
        return svgIcoParticular;
        break;
      case 3:
        return svgIcoPark;
        break;
      case 4:
        return svgIcoMuseum;
        break;
      case 5:
        return svgIcoCafe;
        break;
      default:
        return null;
    }
  }

  /// Название категории, соответствующее категории, порядковый номер которой
  /// передаётся в качестве параметра
  String getCategory(int index) {
    switch (index) {
      case 0:
        return lblHotels;
        break;
      case 1:
        return lblRest;
        break;
      case 2:
        return lblPart;
        break;
      case 3:
        return lblPark;
        break;
      case 4:
        return lblMuseum;
        break;
      case 5:
        return lblCafe;
        break;
      default:
        return '';
    }
  }

  /// Виджет Кнопка-чекбокс для фильтра
  Widget filterButton(
    int index,
  ) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).dividerColor,
                  onPressed: () {
                    _filterButtonPressed(index);
                  },
                  elevation: 0,
                  child: getCategoryIcon(index),
                ),
              ),
              Positioned(
                top: 48,
                left: 48,
                child: Container(
                  // color: Colors.white,
                  width: 16,
                  height: 16,
                  child: filteredCheckBox(index),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 16,
                // color: Colors.lime,
                child: Text(
                  getCategory(index),
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// текстовая метка, отображающая значение фильтра расстояния
  Widget getFilteredDistantionCaption() {
    String start = (filteredRange.start / 1000).toStringAsFixed(1);
    String end = (filteredRange.end / 1000).toStringAsFixed(1);

    return Text(
      'От $start до $end км',
      style:
          Theme.of(context).primaryTextTheme.bodyText2.copyWith(fontSize: 16),
    );
  }

  /// ф-я переводящая градусы в радианы
  //(по идее должна быть стандартная)
  double gradToRadians(double aGrad) {
    const pi = 3.1416;
    return aGrad * pi / 180;
  }

  /// ф-я определяющее расстояние по координатам двух точек
  double getDistance(
      {double latMy = 49.95898, lonMy = 36.34075, latSihgt = 0, lonSight = 0}) {
    const double R = 6371; // радиус Земли

    double sin1 = sin((gradToRadians(latSihgt) - gradToRadians(latMy)) / 2);
    double sin2 = sin((gradToRadians(lonSight) - gradToRadians(lonMy)) / 2);
    return 2 *
        R *
        asin(sqrt(sin1 * sin1 +
            sin2 *
                sin2 *
                cos(gradToRadians(latSihgt)) *
                cos(gradToRadians(latMy))));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
    );

    return Scaffold(
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
          child: SizedBox(
            width: double.infinity,
            height: 48.0,
            child: FlatButton(
              color: Theme.of(context).accentColor,
              height: 48,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Text(
                lblShow,
                style: Theme.of(context).primaryTextTheme.button,
              ),
              onPressed: () {
                print('Build Path was pressed');
                getFilteredSights();
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              height: 80.0,
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 36,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          hoverColor: Colors.white,
                          // Theme.of(context).scaffoldBackgroundColor,
                          padding: EdgeInsets.all(0),
                          iconSize: 24,
                          icon: coloredIcoArrow(
                              Theme.of(context).primaryColorDark),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 42,
                    child: GestureDetector(
                      child: Text(
                        lblClear,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.button,
                      ),
                      onTap: () {
                        for (int i = 0; i < 6; i++) {
                          if (filterCheckValues[i]) {
                            _filterButtonPressed(i);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 24,
                  child: Text(
                    lblCategories,
                    style:
                        Theme.of(context).primaryTextTheme.headline1.copyWith(
                              color: Theme.of(context).shadowColor,
                              fontSize: 12,
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 24,
                  ),
                  child: Stack(children: [
                    Container(
                      // color: Colors.lime,
                      height: 264,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 40,
                        ),
                        child: Container(
                          height: 224,
                          child: Column(
                            children: [
                              Container(
                                height: 92,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 96,
                                      height: 92,
                                      child: Container(
                                        // color: Colors.red,
                                        child: filterButton(0),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 96,
                                      height: 92,
                                      child: Container(
                                        child: filterButton(1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 96,
                                      height: 92,
                                      child: filterButton(2),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Container(
                                  height: 92,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 96,
                                        height: 92,
                                        child: Container(
                                          child: filterButton(3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 92,
                                        child: Container(
                                          // color: Colors.red,
                                          child: filterButton(4),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 96,
                                        height: 92,
                                        child: Container(
                                          child: filterButton(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Container(
                height: 96,
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 4,
                      child: Text(
                        lblDistantion,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 4,
                      child: getFilteredDistantionCaption(),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 48,
                      child: RangeSlider(
                        activeColor: Theme.of(context).accentColor,
                        // inactiveColor: ,
                        min: 100,
                        max: 10000,
                        values: filteredRange,
                        onChanged: (RangeValues newRange) {
                          setState(() {
                            filteredRange = newRange;
                            getFilteredSights();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
