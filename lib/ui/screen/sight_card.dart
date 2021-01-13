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


    return

      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Column(

        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
            ),
              color: Color(0xFF801E48),
            ),
            // color: Color(0xFF801E48),
            height: 96.0,
            alignment: Alignment.topLeft, // !просмотреть
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 16,
                  child: //Text.rich(
                  // Тип (Type) достопримечательности
                  Text.rich(
                      TextSpan(
                        style: styleSightType,
                        text: sight.type,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    )
                ),
                Positioned(
                    right: 16,
                    top: 16,
                    child: //Text.rich(
                  Container( // иконка (заглушка)
                    color: Colors.white,
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              color: Color(0xFFF5F5F5),
            ),
            height: 92.0,
            child: Stack(
              children: [
                Positioned(
                    left: 16,
                    right: 16,
                    top: 16,
                    child:
                    // Название (name) достопримечательности
                    RichText(
                      text: TextSpan(
                        style: styleSightName,
                        text: sight.name,
                      ),
                      maxLines: 2, // ограничение в 3 строки
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    )
                ),
                Positioned(
                    left: 16,
                    right: 16,
                    top: 58,
                    child: //Text.rich(
                    // Описание (details) достопримечательности
                    Text.rich(
                      TextSpan(
                        style: styleSightDetails,
                        text: sight.details,
                      ),

                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    )
                ),
              ],
            ),
          ),
        ],
    ),
      );
  }
}
