import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

/// экран детализации места
class SightDetails extends StatelessWidget {
// по логике это надо было назвать SightDetailsScreen
// но сделал как в задании, чтобы не путаться

  final Sight sight;
  const SightDetails({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Theme.of(context).brightness,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
    );

    // Ширина экрана
    var scrWidth = MediaQuery.of(context).size.width;

    Type getContRuntimeType() {
      return context.runtimeType;
    }

    /// Название достопримечательности
    TextSpan tsTitle = TextSpan(
      style: Theme.of(context).primaryTextTheme.headline4,
      text: sight.name,
    );

    /// Тип достопримечательности
    TextSpan tsType = TextSpan(
      style: Theme.of(context).primaryTextTheme.subtitle1,
      text: sight.type,
    );

    ///Описание  достопримечательности
    TextSpan tsDetail = TextSpan(
      style: Theme.of(context).primaryTextTheme.caption,
      text: sight.details,
    );

    /// Непонятная пока надпись о том, кто когда закроется
    TextSpan sightDetailsSubType = TextSpan(
      // Возможно более практичный вариант, чем городить каждый раз свой стиль
      style: Theme.of(context).primaryTextTheme.caption.copyWith(
            color: Theme.of(context).shadowColor,
          ),
      text: lblClosedMock, // совершенно неясно, как получать это. Пока заглушка
    );

    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              // контейнер нужен для отображения индикатора
              height: 360.0,
              child: Stack(
                children: [
                  Image.network(
                    sight.url,
                    fit: BoxFit.fitHeight,
                    height: 360,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 16,
                    top: 36,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding: EdgeInsets.all(0),
                          iconSize: 24,
                          icon: svgIcoArrow,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 0),
                        child: RichText(text: tsTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: tsType,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: RichText(
                                text: sightDetailsSubType,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 0),
                        child: RichText(text: tsDetail),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.0,
                          child: RaisedButton.icon(
                            icon: svgIcoPath,
                            label: Text(
                              lblBuildPath,
                              style: Theme.of(context).primaryTextTheme.button,
                            ),
                            color: Theme.of(context).accentColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            onPressed: () {
                              print('Build Path was pressed');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 0),
                        child: Container(
                          // Непонятный прозрачный бордер на макете
                          height: 0.8,
                          // Согласно stackowerflow 40 позволяет задать прозрачность
                          color: clTabBarColorTransparent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
                        child: Row(
                          // Исхожу из предпосылки, что это кнопки
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40.0,
                                  child: RaisedButton.icon(
                                    textColor: Theme.of(context)
                                        .primaryTextTheme
                                        .caption
                                        .color,
                                    icon: SvgIcoCalendar(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .caption
                                          .color,
                                    ),
                                    label: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: scrWidth / 2 - 80),
                                      child: Text(
                                        lblPlan,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                    ),
                                    onPressed: () {
                                      print(lblPlan + 'was pressed');
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40.0,
                                  child: RaisedButton.icon(
                                    textColor: Theme.of(context)
                                        .primaryTextTheme
                                        .caption
                                        .color,
                                    icon: SvgIcoHeart.SvgIcoHeartTransp(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .caption
                                          .color,
                                    ),
                                    label: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: scrWidth / 2 - 80),
                                      child: Text(
                                        lblFavorit,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                    ),
                                    onPressed: () {
                                      print(lblFavorit + ' was pressed');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
