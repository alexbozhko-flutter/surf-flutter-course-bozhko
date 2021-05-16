import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/app_colors.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';
import 'package:places/ui/styles.dart';

const barHeight = 56;

/// Кастомный AppBar
class SightListAppBar extends StatelessWidget implements PreferredSizeWidget {
  SightListAppBar({Key key})
      : preferredSize = Size.fromHeight(56),
        // константу или выражение сюда подставить нельзя
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        height: 56,
        color: Colors.yellow,
        child: Stack(
          children: [
            Center(
              child: Text(
                lblNewPlace,
              ),
            ),
            Positioned(
              top: 18,
              left: 16,
              child: Text(
                lblCancel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// экран фильтра
class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  /// вывод заголовка для поля ввода
  Widget fieldTitle(
    String caption,
  ) {
    return Text(
      caption,
      style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 12),
    );
  }

  final _titleFocusNode = FocusNode();
  final _lonFocusNode = FocusNode();
  final _latFocusNode = FocusNode();
  final _detailFocusNode = FocusNode();

  /// Контролер для п. ввода названия
  final _titleController = TextEditingController();

  /// Контролер для п. ввода широты
  final _latController = TextEditingController.fromValue(TextEditingValue(
    text: '0',
  ));

  /// Контролер для п. ввода долготы
  final _lonController = TextEditingController.fromValue(TextEditingValue(
    text: '0',
  ));

  /// Контролер для п. ввода описания
  final _detailController = TextEditingController();

  bool _isTitleValid = true;
  bool _isDetailsValid = true;

  bool _isLatValid = true;
  bool _isLonValid = true;
  bool _isLonEmpty = false;
  bool _isLatEmpty = false;

  bool _retValue;

  String detailValue;

  /// Возвращает текст ошибки если обязательное строковое поле пустое
  String getTextFieldErrorText(String value, FocusNode node) {
    if (!node.hasFocus & value.isEmpty) {
      return txtEmptyVal;
    } else {
      return null;
    }
  }

  bool checkValidation() {
    if (_titleController.text.isEmpty) {
      setState(() {
        _isTitleValid = false;
      });
    }

    if (_detailController.text.isEmpty) {
      setState(() {
        _isDetailsValid = false;
      });
    }

    // Проверяем долготу (не пусто, <180 и >0)
    if (_lonController.text.isEmpty) {
      setState(() {
        _isLonValid = false;
        _isLonEmpty = true;
      });
    } else {
      _isLonEmpty = false;
      if ((double.parse(_lonController.text) > 180) |
          (double.parse(_lonController.text) < 0)) {
        setState(() {
          _isLonValid = false;
        });
      } else {
        _isLonValid = true;
      }
    }

    // Проверяем широоту (не пусто, <90 и >-90)
    if (_latController.text.length == 0) {
      setState(() {
        _isLatValid = false;
        _isLatEmpty = true;
      });
    } else {
      _isLatEmpty = false;
      if ((double.parse(_latController.text) > 90) |
          (double.parse(_latController.text) < -90)) {
        setState(() {
          _isLatValid = false;
        });
      } else {
        _isLatValid = true;
      }
    }


    return _isTitleValid & _isDetailsValid & _isLatValid & _isLonValid;
  }

  @override
  void initState() {
    super.initState();

    _latFocusNode.addListener(() {
      if (_latFocusNode.hasFocus) {
        if (_latController.text == "0") {
          _latController.selection = TextSelection(
              baseOffset: 0, extentOffset: _latController.text.length);
        }
      }
      setState(() {});
    });

    _lonFocusNode.addListener(() {
      if (_lonFocusNode.hasFocus) {
        if (_lonController.text == "0") {
          _lonController.selection = TextSelection(
              baseOffset: 0, extentOffset: _lonController.text.length);
        }
      }
      setState(() {});
    });
  }

  Padding coordinatesPadding(bool isValid, Widget child) {
    if (isValid) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: child,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 0,
        ),
        child: child,
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _latController.dispose();
    _lonController.dispose();
    _detailController.dispose();
    super.dispose();
  }

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
      appBar: SightListAppBar(),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 0,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.lightGreenAccent,
                          height: 64,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                child: fieldTitle(
                                  lblCategory,
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 30,
                                child: Text(
                                  //! Need Style
                                  lblIsNotSelected,
                                ),
                              ),
                              Positioned(
                                right: 24,
                                top: 28,
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    // iconSize: 24,
                                    icon: svgIcoSelect,
                                    onPressed: () {
                                      print('Select was pressed');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Divider(
                            height: 1,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        Container(
                          // height: 184,
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16, top: 24),
                                child: Container(
                                  color: Colors.white,
                                  // height: 68.0,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: fieldTitle(
                                          lblTitle,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 12,
                                        ),

                                        /// Поле ввода НАЗВАНИЕ
                                        child: TextField(
                                          focusNode: _titleFocusNode,
                                          controller: _titleController,
                                          textInputAction: TextInputAction.next,
                                          autofocus: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                          decoration: InputDecoration(
                                            errorStyle: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .errorColor,
                                                ),
                                            errorText: getTextFieldErrorText(
                                                _titleController.text,
                                                _titleFocusNode),
                                            contentPadding: EdgeInsets.all(11),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 24,
                                ),
                                child: Container(
                                  height: 68,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            color: Colors.amber,
                                            height: 68,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: fieldTitle(
                                                    lblLat,
                                                  ),
                                                ),
                                                coordinatesPadding(
                                                  _isLatValid,
                                                  SizedBox(
                                                    height:
                                                        _isLatValid ? 40 : 55,

                                                    /// Поле ввода ШИРОТА
                                                    child: TextField(
                                                      focusNode: _latFocusNode,
                                                      controller:
                                                          _latController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      autofocus: true,
                                                      onEditingComplete: () {
                                                        _lonFocusNode
                                                            .requestFocus();
                                                        setState(() {});
                                                      },
                                                      onChanged: (String text) {
                                                        if (text.isEmpty) {
                                                          text = "0";
                                                        }
                                                        // Чтобы
                                                        checkValidation();
                                                        // setState(() {});
                                                      },
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1,
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline1
                                                                .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .errorColor,
                                                                  // fontSize: 10,
                                                                ),
                                                        errorText: _isLatEmpty
                                                            ? txtEmptyVal
                                                            : (_isLatValid
                                                                ? null
                                                                : txtWrongRangeLat),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 16,
                                                                top: 10),
                                                        suffixIcon:
                                                            _latFocusNode
                                                                    .hasFocus
                                                                ? IconButton(
                                                                    icon:
                                                                        SizedBox(
                                                                      child:
                                                                          svgIcoClear,
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      // _lonController.clear();
                                                                      _latController
                                                                              .text =
                                                                          "0";
                                                                    },
                                                                  )
                                                                : null,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        // flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Container(
                                            color: Colors.greenAccent,
                                            height: 68,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: fieldTitle(
                                                    lblLong,
                                                  ),
                                                ),
                                                coordinatesPadding(
                                                  _isLonValid,
                                                  SizedBox(
                                                    height:
                                                        _isLonValid ? 40 : 55,

                                                    /// Поле ввода ДОЛГОТА
                                                    child: TextField(
                                                      focusNode: _lonFocusNode,
                                                      controller:
                                                          _lonController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      autofocus: true,

                                                      onEditingComplete: () {
                                                        _detailFocusNode
                                                            .requestFocus();
                                                        setState(() {});
                                                      },
                                                      onChanged: (String text) {
                                                        if (text.isEmpty) {
                                                          text = "0";
                                                        }
                                                        // Чтобы
                                                        checkValidation();
                                                        setState(() {});
                                                      },
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1,
                                                      // onSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                                                      // inputFormatters: <TextInputFormatter>[
                                                      //   FilteringTextInputFormatter.allow(
                                                      //       RegExp(
                                                      //           r'^(\+|-)?((\d((\.)|\.\d{1,6})?)|(0*?\d\d((\.)|\.\d{1,6})?)|(0*?1[0-7]\d((\.)|\.\d{1,6})?)|(0*?180((\.)|\.0{1,6})?))$')),
                                                      // ],

                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline1
                                                                .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .errorColor,
                                                                ),
                                                        errorText: _isLonEmpty
                                                            ? txtEmptyVal
                                                            : (_isLonValid
                                                                ? null
                                                                : txtWrongRangeLon),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 16,
                                                                top: 10),
                                                        suffixIcon:
                                                            _lonFocusNode
                                                                    .hasFocus
                                                                ? IconButton(
                                                                    icon:
                                                                        SizedBox(
                                                                      child:
                                                                          svgIcoClear,
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      // _lonController.clear();
                                                                      _lonController
                                                                              .text =
                                                                          "0";
                                                                    },
                                                                  )
                                                                : null,
                                                      ),
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
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 24,
                          ),
                          child: Container(
                            height: 108,
                            color: Colors.yellow,
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: fieldTitle(
                                  lblDescription,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 12, 16, 0),
                                child: Container(
                                  color: Colors.white,
                                  height: 80,
                                  padding: EdgeInsets.all(1),
                                  child: TextField(
                                    focusNode: _detailFocusNode,
                                    controller: _detailController,
                                    textInputAction: TextInputAction.next,
                                    maxLines: 5,
                                    autofocus: true,
                                    style:
                                        Theme.of(context).textTheme.headline1,

                                    onSubmitted: (text) {
                                      print(text);
                                      detailValue = text;
                                    },
                                    // decoration: InputDecoration(
                                    //   contentPadding: EdgeInsets.all(11),
                                    //   isDense: true,
                                    // ),
                                  ),

                                  //(
                                  // onSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                                  //  textInputAction: TextInputAction.next,
                                  // autofocus: true,
                                  // maxLines: 12,
                                  // style: Theme.of(context).textTheme.headline1,
                                  // ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      // color: Theme.of(context).scaffoldBackgroundColor,
                      // height: double.infinity,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.0,
                          child: FlatButton(
                            autofocus: false,
                            color: Theme.of(context).accentColor,
                            height: 48,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Text(
                              lblCreate,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .button
                                  .copyWith(
                                      // color:
                                      ),
                            ),
                            onPressed: () {
                              print('Build Path was pressed');
                              print(_titleController.text);

                              if (checkValidation()) {
                                Sight _sightNew = Sight(
                                  _titleController.text,
                                  double.parse(_latController.text),
                                  double.parse(_lonController.text),
                                  '', // Очевидно, URL введём потом
                                  _detailController.text,
                                  lblCategory, // Заглушка. Потом  будет подставлено значение
                                );
                                mocks.add(_sightNew);

                                // Пока я не понимаю, имеет ли смысл очищать поля ввода
                                // после нажатия кнопки

                                // смотрим содержимое массива для проверки
                                for (int i = 0; i < mocks.length; i++) {
                                  print('--------');
                                  print(mocks[i].details);
                                  //
                                  // setState(){
                                  //   mocks.add(_sight);
                                  //
                                  //
                                  //
                                  //   }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: null,
    );
  }
}
