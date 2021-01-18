import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles.dart';

TextSpan appBarTitle = TextSpan(
  style: largeTitle,
  text: "Список \nинтересных мест",
);

class SightCard extends StatelessWidget {
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
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                color: Color(0xFF801E48),
              ),

              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Positioned(
                      left: 16,
                      top: 16,
                      child: //Text.rich(
                          // Тип (Type) достопримечательности
                          RichText(
                        text: TextSpan(
                          style: styleSightType,
                          text: sight.type,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: //Text.rich(
                        Container(
                      // иконка (заглушка)
                      color: Colors.white,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                color: Color(0xFFF5F5F5),
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
                        constraints:
                            BoxConstraints(maxWidth: scrWidth / 2 - 32),
                        child: Container(
                          color: Color(0xffC4C4C4),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 3.0,
                              top: 2.0,
                              right: 9.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: styleSightName,
                                text: sight.name,
                              ),
                              maxLines: 3, // ограничение в 3 строки
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
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
                            style: styleSightDetails,
                            // text: sight.details,
                            text: "закрыто до 20:00",
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
