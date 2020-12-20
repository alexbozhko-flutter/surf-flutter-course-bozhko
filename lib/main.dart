import 'package:flutter/material.dart';

import 'ui/screen/sight_list_sreen.dart';

// int counter = 0;
void main() {
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

      // home: MyFirstWidget(),
      // home: MySecondWidget(),
      home: SightListScreen(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  @override
  int _counter = 0;

  Widget build(BuildContext context) {
    Type getContRuntimeType() {
      return context.runtimeType;
    }
    //Для наглядности повесил вызов на кнопку
    return Container(
      color: Colors.blue,
      child: Center(
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          elevation: 18.0,
          color: Color(0xFF801E48),
          child: Text('Click me!',
              style: TextStyle(fontSize: 16.0, color: Colors.white)),
          onPressed: () {
            print(
                'Runtime Type Is: ${getContRuntimeType()}'); //Выводит: Runtime Type Is: StatelessElement
          },
        ),
      ),
    );
  }
}

class MySecondWidget extends StatefulWidget {
  @override
  _MySecondWidgetState createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Type _getContRuntimeType() {
      return context.runtimeType;
    }

   // print('canPop ${Navigator.of(context).canPop()}'); //Тут работает

    //Для наглядности повесил вызов на кнопку
    return Container(
      color: Color(0xFF801E48),
      child: Center(
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          elevation: 18.0,
          color: Colors.blue,
          child: Text('Click me!',
              style: TextStyle(fontSize: 16.0, color: Colors.white)),
          onPressed: () {
            print(
                'Runtime Type Is: ${_getContRuntimeType()}'); //Выводит: Runtime Type Is: StatelessElement
          },
        ),
      ),
    );
  }
}
