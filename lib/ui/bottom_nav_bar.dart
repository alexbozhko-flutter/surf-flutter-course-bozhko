import 'package:flutter/material.dart';

/// Нижнее меню приложения
BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedFontSize: 12.0,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon:
        Image.asset(
          'res/images/icon_list.png',
          width: 24.0,
          height: 24.0,),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon:
        Image.asset(
          'res/images/icon_map.png',
          width: 24.0,
          height: 24.0,),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon:
        Image.asset(
          'res/images/icon_heart.png',
          width: 24.0,
          height: 24.0,),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon:
        Image.asset(
          'res/images/icon_settings.png',
          width: 24.0,
          height: 24.0,),
        title: Text(""),
      ),
    ]);
