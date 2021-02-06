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
          icon: icoList,
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: icoMap,
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: icoHeart,
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: icoSettings,
          title: Text(""),
        ),
      ],
    );
  }
}
