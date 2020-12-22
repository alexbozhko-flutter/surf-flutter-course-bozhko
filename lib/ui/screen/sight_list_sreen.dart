import 'package:flutter/material.dart';

// Сразу вынес стиль в переменную, вероятно придётся использовать его в других
// формах.
TextStyle largeTitle = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

// StatefulWidget для задания 4.2
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

// реализация состояния
class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // status bar color
        brightness: Brightness.light, // status bar brightness
        // суммарная высота двух строк и полей из макета
        // три строки тоже зайдёт за счёт полей, больше 3-х не будет
        toolbarHeight: 200,
        elevation: 0.0, //убирает тень appbar'а

        title: Text(
          'Список интересных мест',
          maxLines: 3, // ограничение в 3 строки
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: largeTitle,
        ),
      ),
    );
  }
}
