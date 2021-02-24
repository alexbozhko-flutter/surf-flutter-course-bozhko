import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
// то, что модуль не используется говорит о том,
// что все цвета подгребаются из тем
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/visited_card.dart';
import 'package:places/ui/screen/want_card.dart';
import 'package:provider/provider.dart';

/// Заглушка-список посещённых мест
final List<Sight> visitedList = [mocks[0], mocks[1]];
// final List<Sight> visitedList = []; // для проверки пустой страницы

/// Заглушка-список "Хочу посетить"
final List<Sight> wantList = [mocks[2]];
// final List<Sight> wantList = []; // для проверки пустой страницы

/// экран Хочу посетить /Посещенные места
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

/// реализация состояния
class _VisitingScreenState extends State<VisitingScreen> {
  DefaultTabController tabControler_;
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Theme.of(context).accentColorBrightness,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0, //убирает тень appbar'а
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).appBarTheme.textTheme.headline1,
                text: lblFavorites,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              child: Stack(
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(
                        40.0,
                      ),
                    ),
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        text: lblWantVisit,
                      ),
                      Tab(
                        text: lblVisited,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            WantListView(),
            VisitedListView(),
          ],
        ),
        bottomNavigationBar: new PlacesBottomNavigationBar(),
        floatingActionButton: Container(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            child: Text(
                Provider.of<ThemeModel>(context).currentTheme == lightTheme
                    ? lblDark
                    : lblLight),
            onPressed: () {
              Provider.of<ThemeModel>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}

/// Класс, генерирующий список "Хочу посетить"
class WantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // пока формируется из моковых данных
    if (wantList.length > 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < wantList.length; i++)
              WantCard(
                sight: wantList[0],
                planedCaption: mocksPlanedCaptions[i],
              ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: icoEmptyWantList,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                lblEmpty,
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
            ),
            Text(
              lblEmptyWantListCaption,
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ],
        ),
      );
    }
  }
}

/// Класс, генерирующий список "Посетил"
class VisitedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Type getContRuntimeType() {
      return context.runtimeType;
    }

    if (visitedList.length > 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < visitedList.length; i++)
              VisitedCard(
                  sight: visitedList[i],
                  visitedCaption: mocksVisitedCaptions[i]),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: icoEmptyVisitedList,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                lblEmpty,
                style: Theme.of(context).primaryTextTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              lblFinishRout,
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ],
        ),
      );
    }
  }
}
