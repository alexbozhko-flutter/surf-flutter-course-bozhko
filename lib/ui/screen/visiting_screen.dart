import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/screen/visited_card.dart';
import 'package:places/ui/screen/want_card.dart';
import 'package:places/ui/styles.dart';

// const barHeight = 80;
const indicatorColor =   Color(0xFF3B3E5B);
const toolBarItemColor = Color(0xFFF5F5F5);

/// Заглушка-список посещённых мест
final List<Sight> visitedList = [mocks[0], mocks[1]];

/// Заглушка-список "Хочу посетить"
final List<Sight> wantList = [mocks[2]];
// final List<Sight> wantList = []; // для проверки пустой страницы


/// TextSpan для отображения заголовка AppBar'а
TextSpan appBarTitle = TextSpan(
  style: visitingTitle,
  text: 'Избранное',
);

TextSpan tabTitleVisited = TextSpan(
  style: visitingTab,
  text: 'Посетил',
);

/// Декоратор для таба
BoxDecoration tabDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(40.0),
  color: Color(0xFFF5F5F5),
);

PreferredSize VisitedTabBar = PreferredSize(
  preferredSize: Size.fromHeight(52),
  child:
  Padding(
    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6) ,

    child: Stack(
      children: [
        //
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: toolBarItemColor,

            borderRadius: BorderRadius.circular(
              40.0,
            ),
          ),
        ),

        TabBar(

          // controller: _tabController,
          // give the indicator a decoration (color and border radius)
          indicatorSize: TabBarIndicatorSize.tab,

          // indicatorPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          indicator: BoxDecoration(

            borderRadius: BorderRadius.circular(
              40.0,
            ),
            color: indicatorColor,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFF7C7E92),
          // unselectedLabelStyle: visitingTitle,
          tabs: [
            Tab(
              text: 'Хочу посетить',
            ),
            Tab(
              text: 'Посетил',
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

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0, //убирает тень appbar'а
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
            WantList(),
            VisitedList(),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
///
Widget WantList(){
  if(wantList.length>0){
  return
    SingleChildScrollView(
      child: Column(

        children: [
          for (int i = 0; i<wantList.length; i++)
            WantCard(sight: wantList[0], planedCaption: mocksPlanedCaptions[i],),
        ],
      ),
    );
  }
  else
    {
      return
          Container(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset('res/images/want_to_visit_empty.png',
              width: 64.0,
              height: 64.0,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Пусто',
                    style: emptyListLarge,
                  ),
                ),
                Text(
                  'Отмечайте понравившиеся \nместа и они появиятся здесь.',
                  style: emptyListSmall,
                ),
              ]
            ),

          );
    }
}

Widget VisitedList(){
  if(visitedList.length>0){
    return
      SingleChildScrollView(
        child: Column(

          children: [
            for (int i = 0; i<visitedList.length; i++)
              VisitedCard(
                  sight: visitedList[i],
                  visitedCaption: mocksVisitedCaptions[i]),
          ],
        ),
      );
  }
  else
  {
    return
      Container(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset('res/images/visited_empty.png',
                  width: 64.0,
                  height: 64.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Пусто',
                  style: emptyListLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Завершите маршрут,\nчтобы место попало сюда.',
                textAlign: TextAlign.center,
                style: emptyListSmall,
              ),
            ]
        ),

      );
  }
}
