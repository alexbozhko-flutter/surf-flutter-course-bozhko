import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/captions.dart';

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

    return Container(
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
                    // иконка (заглушка)
                    color: Colors.white,
                    width: 36.0,
                    height: 36.0,
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
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: clGreenCaption,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                              child: Container(
                                height: 40.0,
                                color: clMockContrast,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                height: 40.0,
                                color: clMockContrast,
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
    );
  }
}
