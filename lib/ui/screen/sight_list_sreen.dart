import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

const barHeight = 196;

/// Кнопка с градиентом
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

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

  final textEditingController = TextEditingController();

  void _showSearchScreen(){
    Navigator.of(context).push(

      MaterialPageRoute(builder: (context) => SightSearchScreen()),
    );
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textEditingController.addListener(_showSearchScreen);
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

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
                  controller: textEditingController,
                  readOnly: true,
                  onChanged: (String text) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SightSearchScreen()));
                  },
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        constraints:
                            BoxConstraints(maxHeight: 20, maxWidth: 20),
                        padding: EdgeInsets.all(0),
                        iconSize: 20,
                        icon: svgIcoFilter,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FiltersScreen()),
                          );
                          print("FILTER PRESSED");
                        },
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedGradientButton(
          width: 177,
          height: 48,
          child: Stack(
            children: [
              Positioned(
                left: 22,
                top: 12,
                child: svgIcoPlus,
              ),
              Positioned(
                left: 54,
                top: 17,
                child: Text(
                  lblNewPlaceL,
                  style: Theme.of(context).primaryTextTheme.headline5.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.03,
                        // color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          gradient: LinearGradient(
            colors: <Color>[
              Theme.of(context).highlightColor,
              Theme.of(context).hoverColor
            ],
          ),
          onPressed: () {
            print('button clicked');
          }),
      bottomNavigationBar: new PlacesBottomNavigationBar(),
    );
  }
}
