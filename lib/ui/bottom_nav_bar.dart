import 'package:flutter/material.dart';
import 'package:places/ui/icons.dart';

/// Виджет, реализующий BottomNavigationBar приложения
class PlacesBottomNavigationBar extends StatelessWidget {
// Если создавать BottomNavigationBar заранее и хранить в памяти,
// он не будет работать, если будет динамический клнтент
// т. к. виджет не будет перестраиваться.
// Поэтому делаем новый виджет, внутри которого реализуем контент
// Пока это заглушка
// Неплохо бы протестить данный кейс!

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          icon: IconButton(
            icon: svgIcoList,
            onPressed: () {
              print('List pressed');
            },
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: svgIcoMap,
            onPressed: () {
              print('Map pressed');
            },
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: svgIcoHeart,
            onPressed: () {
              print('Heart pressed');
            },
          ),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: svgIcoSettings,
            onPressed: () {
              print('Settings pressed');
            },
          ),
          title: Text(""),
        ),
      ],
    );
  }
}
