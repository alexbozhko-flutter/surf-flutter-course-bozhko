import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles.dart';

/// экран детализации места
class SightDetails extends StatelessWidget {
// по логике это надо было назвать SightDetailsScreen
// но сделал как в задании, чтобы не путаться

  final Sight sight;
  const SightDetails({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Type getContRuntimeType() {
      return context.runtimeType;
    }

    /// Название достопримечательности
    TextSpan tsTitle = TextSpan(
      style: styleSightNameScrDetail,
      text: sight.name,
    );

    /// Тип достопримечательности
    TextSpan tsType = TextSpan(
      style: styleSightTypeScrDetail,
      text: sight.type,
    );

    ///Описание  достопримечательности
    TextSpan tsDetail = TextSpan(
      style: styleSightDetailsScrDetail,
      text: sight.details,
    );

    ///
    TextSpan sightDetailsSubType = TextSpan(
      style: styleSightSubTypeScrDetail,
      text:
          'закрыто до 9:00', // совершенно неясно, как получать это. Пока заглушка
    );

    return Column(
      children: [
        Container(
          color: Color(0xFF801E48),
          height: 360.0,
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 36,
                child: //Text.rich(
                    Container(
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
            color: Colors.white,
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
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
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
                          color: Color(0xff4CAF50),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 0),
                    child: Container(
                      // Непонятный прозрачный бордер на макете
                      height: 0.8,
                      // Согласно stackowerflow 40 позволяет задать прозрачность
                      color: Color(0x407C7E92),
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
                              color: Color(0xFF801E48),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              height: 40.0,
                              color: Color(0xFF801E48),
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
    );
  }
}
