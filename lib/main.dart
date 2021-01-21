import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'mocks.dart';
import 'ui/screen/sight_list_sreen.dart';
import 'package:flutter/services.dart';

// int counter = 0;
void main() {
  // Таком образом мы явно задаём цвет статусбара, а точнее -
  // убираем его затенение, чтобы он соответствовал макету
  // По аналогии с проилолжением Facebook (белый Appbar И белый Statusbar)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Type getContRuntimeType() {
      return context.runtimeType;
    }

    print(
        'getContRuntimeTypeApp ${getContRuntimeType()}'); //getContRuntimeTypeApp StatelessElement
    // print('canPop ${Navigator.of(context).canPop()}'); // Проверил пример из видео
    return MaterialApp(
      title: 'My Title Flutter Demo', //

      // home: SightListScreen(),
      // home: SightCard(sight: mocks[0]),

      home: SightDetails(sight: mocks[1]),
    );
  }
}
