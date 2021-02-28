import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

/// Карта достопримечательностей
class SightCard extends StatelessWidget {
// Вполне вероятно, что тут уместно использовать виджет Card
// Но оставил как изначально было в задании
  final Sight sight;

  const SightCard({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Type getContRuntimeType() {
      return context.runtimeType;
    }

    // Ширина экрана
    var scrWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 3 / 1,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.fitWidth,
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
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: RichText(
                  // Тип (Type) достопримечательности
                  text: TextSpan(
                    style: Theme.of(context).primaryTextTheme.headline5,
                    text: sight.type,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 24,
                    icon: svgIcoHeartTransp,
                    onPressed: () {
                      print('Calendar was pressed');
                    },
                  ),
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                color: Theme.of(context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                      child: Container(),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstrainedBox(
                        // Насколько я понимаю, задача была академичкская
                        // на странице map этого ограничения нет
                        constraints: BoxConstraints(maxWidth: scrWidth - 64),
                        // BoxConstraints(maxWidth: scrWidth / 2 - 32),

                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                            text: sight.name,
                          ),
                          maxLines: 3, // ограничение в 3 строки
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).primaryTextTheme.bodyText2,
                            text: lblClosedMock,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
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
