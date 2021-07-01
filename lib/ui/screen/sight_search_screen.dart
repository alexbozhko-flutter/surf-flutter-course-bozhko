import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';

const barHeight = 108; //56+52

class ResultSight extends StatelessWidget {
  final Sight resultSight;

  const ResultSight({
    Key key,
    this.resultSight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class SearchResults extends StatelessWidget {
  final List<Sight> resultList;

  const SearchResults({
    Key key,
    this.resultList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (resultList.length > 0)
        ? Column(
            children: [
              for (int i = 0; i <= resultList.length - 1; i++)
                InkWell(
                  child: Container(
                    color: Colors.red,
                    height: 78,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Image.network(
                          resultList[i].url,
                          fit: BoxFit.fitHeight,
                          height: 56,
                          width: 56,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Text(
                                resultList[i].name,
                              ),
                            ),
                            Text(
                              resultList[i].type,
                            ),
                            Divider(
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SightDetails(sight: resultList[i])),
                    );
                  },
                ),
            ],
          )
        : Column(
            children: [
              Container(
                color: Colors.red,
                height: 122,
              ),
            ],
          );
  }
}

/// Класс для отображения истории запросов
class QueriesHistoryList extends StatefulWidget {
  const QueriesHistoryList({Key key}) : super(key: key);

  @override
  _QueriesHistoryListState createState() => _QueriesHistoryListState();
}

class _QueriesHistoryListState extends State<QueriesHistoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 24, bottom: 16, right: 16),
          child: Container(
            color: Colors.red,
            child: Text(
              txtYouWhereLookingFor,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Column(
          children: [
            for (int i = 0; i <= mockSearchQueries.length - 1; i++)
              Column(
                children: [
                  Container(
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 17,
                            bottom: 14,
                          ),
                          child: Text(
                            mockSearchQueries[i],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            iconSize: 24,
                            icon: svgIcoCross,
                            onPressed: () {
                              setState(() {
                                mockSearchQueries.removeAt(i);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Container(
                      height: 2,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
          ],
        )
      ],
    );
  }
}

/// Кастомный AppBar
class SightListAppBar extends StatefulWidget implements PreferredSizeWidget {
  SightListAppBar({Key key})
      : preferredSize = Size.fromHeight(
            114), // константу или выражение сюда подставить нельзя
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
            alignment: Alignment.center,
            child: Container(
              height: 24,
              color: Colors.greenAccent,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).primaryTextTheme.headline4.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                  text: lblSightListScreenTitle,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
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

                /// Поиск
                child: SearchBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// StatefulWidget для задания 5.4.2 (Список интересных мест)
class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

/// реализация состояния
class _SightSearchScreenState extends State<SightSearchScreen> {
  List<Sight> searchResults = [
    mocks[0],
    mocks[2],
    mocks[3],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SightListAppBar(),
      body: Container(
        color: Colors.blue,
        child: (1 == 1) //! ВАписать условие
            ? SearchResults(
                resultList: searchResults,
              )
            : QueriesHistoryList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: new PlacesBottomNavigationBar(),
    );
  }
}
