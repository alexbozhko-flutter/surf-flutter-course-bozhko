import 'package:flutter/material.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String text) {},
      style: Theme.of(context).primaryTextTheme.bodyText1,
      decoration: InputDecoration(
          suffixIcon:
          IconButton(
            icon: svgIcoClearNormal,
            onPressed: () {
              print('Clear pressed');
            },
          ),
          prefixIcon:
          IconButton(
            icon: svgIcoSrch,
            onPressed: () {
              print('Search pressed');
            },
          ),

          hintText: lblSearch),
    );
  }
}
