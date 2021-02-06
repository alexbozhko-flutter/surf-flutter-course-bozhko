import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/visited_card.dart';
import 'package:places/ui/screen/want_card.dart';
import 'package:places/ui/styles.dart';

/// Заглушка-список посещённых мест
final List<Sight> visitedList = [mocks[0], mocks[1]];
// final List<Sight> visitedList = []; // для проверки пустой страницы

/// Заглушка-список "Хочу посетить"
final List<Sight> wantList = [mocks[2]];
// final List<Sight> wantList = []; // для проверки пустой страницы

/// TextSpan для отображения заголовка AppBar'а
TextSpan appBarTitle = TextSpan(
  style: visitingTitle,
  text: lblFavorites,
);

TextSpan tabTitleVisited = TextSpan(
  style: visitingTab,
  text: lblVisited,
);

/// Декоратор для таба
BoxDecoration tabDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(40.0),
  color: clInactiveGrey,
);

PreferredSize VisitedTabBar = PreferredSize(
  preferredSize: Size.fromHeight(52),
  child: Padding(
    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
    child: Stack(
      children: [
        //
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: clInactiveGrey,
            borderRadius: BorderRadius.circular(
              40.0,
            ),
          ),
        ),

        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              40.0,
            ),
            color: clIndicatorColor,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: clTabBarColor,
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
);

/// экран Хочу посетить /Посещенные места
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

/// реализация состояния
class _VisitingScreenState extends State<VisitingScreen> {
  DefaultTabController tabControler_;

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          //убирает тень appbar'а
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Center(
            child: RichText(
              text: appBarTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          bottom: VisitedTabBar,
        ),
        body: TabBarView(
          children: [
            wantListView(),
            visitedListView(),
          ],
        ),
        bottomNavigationBar: new PlacesBottomNavigationBar(),
      ),
    );
  }
}

/// Список "Хочу посетить"
Widget wantListView() {
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
              style: emptyListLarge,
            ),
          ),
          Text(
            lblEmptyWantListCaption,
            style: emptyListSmall,
          ),
        ],
      ),
    );
  }
}

/// Список посещенных мест
Widget visitedListView() {
  if (visitedList.length > 0) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < visitedList.length; i++)
            VisitedCard(
                sight: visitedList[i], visitedCaption: mocksVisitedCaptions[i]),
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
              style: emptyListLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            lblFinishRout,
            textAlign: TextAlign.center,
            style: emptyListSmall,
          ),
        ],
      ),
    );
  }
}
