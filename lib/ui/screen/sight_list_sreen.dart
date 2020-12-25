import 'package:flutter/material.dart';

// Сразу вынес стиль в переменную, вероятно придётся использовать его в других
// формах.
TextStyle largeTitle = TextStyle(
  color: Color(0xff3B3E5B), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 32.0, //фонт пришлось увеличить принудительно, похоже размер шрифта
  // в RichText воспроизводится неправильно (см. ниже по коду)
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

TextStyle largeTitleGreen = TextStyle(
  color: Color(0xff4CAF50), //hex color из css макета
// В данном случае остальные параметры можно не дублировать
  fontFamily: 'Roboto',
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

TextStyle largeTitleYellow = TextStyle(
  color: Color(0xffFCDD3D), //hex color из css макета
  fontFamily: 'Roboto',
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

/// TextSpan для отображения заголовка AppBar'а
TextSpan appBarTitle = TextSpan(
    style: largeTitle,
    children: [
      TextSpan(
        text: 'С',
        style: largeTitleGreen,
      ),
      TextSpan(
        text: 'писок',
      ),
      TextSpan(
        text: '\nи',
        style: largeTitleYellow,
      ),
      TextSpan(
        text: 'нтересных мест',
      ),
    ]);


/// StatefulWidget для задания 4.2
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}


/// реализация состояния
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

// Оставил код из предыдущего таска в комментарии
// у меня проявился вот этот баг, легче будет воспроизвести
// https://github.com/flutter/flutter/issues/14675
/*
        title: Text(
          'Список\nинтересных мест',
          maxLines: 3, // ограничение в 3 строки
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          // style: largeTitle,
          style: largeTitle,
        ),
*/

        title:
// Если использовать нижеследующий код, то размер шрифта будет точно таким же,
// как и при использовании виджета Text (визуально это будет соответствовать
// макету).
/*        Text.rich(appBarTitle,
            maxLines: 3, // ограничение в 3 строки
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            ),
*/
// данный вариант соответствует заданию
        RichText(
          text: appBarTitle,
          maxLines: 3, // ограничение в 3 строки
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
