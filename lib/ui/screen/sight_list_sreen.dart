import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/sight_card.dart';

const barHeight = 196;

/// Кастомный AppBar
class SightListAppBar extends StatefulWidget implements PreferredSizeWidget {
  SightListAppBar({Key key})
      : preferredSize = Size.fromHeight(
            196), // константу или выражение сюда подставить нельзя
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _SightListAppBarState createState() => _SightListAppBarState();
}

class _SightListAppBarState extends State<SightListAppBar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return AppBar(
      textTheme: Theme.of(context).primaryTextTheme,
      toolbarHeight: MediaQuery.of(context).padding.top + barHeight,
      elevation: 0.0, //убирает тень appbar'а
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).primaryTextTheme.headline6,
                  text: lblSightListScreenTitle,
                ),
                maxLines: 2, // ограничение в 3 строки
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
            child: SizedBox(
              height: 52,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  decoration: InputDecoration(
                      suffixIcon: ImageIcon(
                        icoSuffix.image,
                        size: Theme.of(context).accentIconTheme.size,
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        // Это точно не inputDecorationTheme
                        color:  Theme.of(context).accentIconTheme.color,
                      ),
                      hintText: lblSearch),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// StatefulWidget для задания 4.2 (Список интересных мест)
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

/// реализация состояния
class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: new PlacesBottomNavigationBar(),
    );
  }
}
