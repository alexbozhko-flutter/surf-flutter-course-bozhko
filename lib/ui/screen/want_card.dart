import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

/// Карта посещенного места
class WantCard extends StatelessWidget {
// Будет сделано наследование от общего предка для всех трёх карт
// Не уверен, что каждый класс должен быть в отдельном файле, но пока так

  final Sight sight;
  final String planedCaption;

  const WantCard({Key key, this.sight, this.planedCaption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Stack(
        children: [
          Column(
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
                    child:
                        // Тип (Type) достопримечательности
                        RichText(
                      text: TextSpan(
                        style: Theme.of(context).primaryTextTheme.headline5,
                        text: sight.type,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
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
                          child: RichText(
                            text: TextSpan(
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              text: sight.name,
                            ),
                            maxLines: 3, // ограничение в 3 строки
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: SizedBox(
                              height: 28,
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                                  text: this.planedCaption,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: RichText(
                              text: TextSpan(
                                style:
                                    Theme.of(context).primaryTextTheme.caption,
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
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  print('Ripple effect');
                },
              ),
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
                icon: svgIcoCross,
                onPressed: () {
                  print('Cross was pressed');
                },
              ),
            ),
          ),
          Positioned(
            right: 56,
            top: 16,
            child: SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 24,
                icon: svgIcoCalendar,
                onPressed: () {
                  print('Calendar was pressed');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
