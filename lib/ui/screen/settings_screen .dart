import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/bottom_nav_bar.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _blnDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, //убирает тень appbar'а
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: Text(
            lblSettings,
            style: Theme.of(context).appBarTheme.textTheme.headline1.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 56,
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 18,
                    child: Text(
                      lblDarkTheme,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 16,
                    child: CupertinoSwitch(
                      value: _blnDarkTheme,
                      onChanged: (value) {
                        setState(() {
                          Provider.of<ThemeModel>(context, listen: false)
                              .toggleTheme();
                          _blnDarkTheme = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 18,
                    child: Text(
                      lblSeeTutorial,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 24,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        // iconSize: 24,
                        icon: svgIcoInfo,
                        onPressed: () {
                          print('Info was pressed');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new PlacesBottomNavigationBar(),
    );
  }
}
