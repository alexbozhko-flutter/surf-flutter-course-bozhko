import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles.dart';


/// Карта посещенного места

class WantCard extends StatelessWidget {
// Будет сделано наследование от общего предка для всех трёх карт
// Не уверен, что каждый класс должен быть в отдельном файле, но пока так

  final Sight sight;
  final String planedCaption;

  const WantCard({Key key, this.sight, this.planedCaption}) : super(key: key);

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
                        child:
                        //LinearProgressIndicator( // Круговой индикатор смотрится уместнее
                        CircularProgressIndicator(
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
                Image.asset(
                  // иконка (заглушка)
                  'res/images/heart.png',
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              Positioned(
                right: 56,
                top: 16,
                child: //Text.rich(
                Image.asset(
                  'res/images/calendar.png',
                  // иконка (заглушка)
                  width: 24.0,
                  height: 24.0,
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: SizedBox(
                          height: 28,
                          child: RichText(
                            text: TextSpan(
                              style: stylePlaned,
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