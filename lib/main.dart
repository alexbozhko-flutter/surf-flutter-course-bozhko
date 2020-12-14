import 'package:flutter/material.dart';

int counter = 0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //  home: MyFirestWidget(),
      home: MySecondWidget(),
    );
  }
}

class MyFirestWidget extends StatelessWidget {
  @override
  int _counter = 0;

  Widget build(BuildContext context) {
    counter++;
    _counter++;

    //Глобальная переменная увеличит значение
    print('Вызов ${counter}');
    //Локальныя переменная, обнулится
    print('Вызов localCounter ${_counter}');
    return Container(
      child: Center(
        child: Text('Hello!'),
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
    setState(() {
      _counter++;
    });
    print('Вызов ${_counter}');

    return Container(
      child: Center(
        // child: Text('Hello! '+'$counter'),
        child: Text('Hello!'),
      ),
    );
  }
}
