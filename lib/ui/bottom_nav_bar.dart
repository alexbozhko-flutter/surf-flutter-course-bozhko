import 'package:flutter/material.dart';
import 'package:places/ui/icons.dart';

/// Нижнее меню приложения
BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
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
