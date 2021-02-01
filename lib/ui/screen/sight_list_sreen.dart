import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/styles.dart';

/// TextSpan для отображения заголовка AppBar'а
TextSpan appBarTitle = TextSpan(
  style: largeTitle,
  text: 'Список \nинтересных мест',
);

const barHeight = 72;

/// Кастомный AppBar
class SightListAppBar extends StatefulWidget implements PreferredSizeWidget {
  SightListAppBar({Key key})
      : preferredSize = Size.fromHeight(
            72), // константу или выражение сюда подставить нельзя
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _SightListAppBarState createState() => _SightListAppBarState();
}

class _SightListAppBarState extends State<SightListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // status bar color
      brightness: Brightness.light, // status bar brightness
      toolbarHeight: MediaQuery.of(context).padding.top + barHeight,
      elevation: 0.0, //убирает тень appbar'а
      title: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          child: RichText(
            text: appBarTitle,
            maxLines: 2, // ограничение в 3 строки
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

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
      appBar: SightListAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Динамическим подгребанием списка я не заморачивался
            // Очевидно дальше будет использован специальный виджет
            SightCard(sight: mocks[0]),
            SightCard(sight: mocks[1]),
            SightCard(sight: mocks[2]),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
