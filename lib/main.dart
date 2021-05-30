import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/settings_screen%20.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/visited_card.dart';
import 'package:provider/provider.dart';
import 'ui/screen/res/themes.dart';
import 'ui/screen/sight_list_sreen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

// Используем Provider
void main() {
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Title Flutter Demo',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      // theme: lightTheme, // Чтобы посмотреть другие экраны
      home: VisitingScreen(),
      // home: FiltersScreen(),
      // home: SettingsScreen(),
      // home: VisitedCard(),
      // home: SightListScreen(),
      // home: SightCard(sight: mocks[0]),
      // home: SightDetails(sight: mocks[1]),
    );
  }
}
