import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/captions.dart';
import 'package:places/ui/icons.dart';

const barHeight = 56;

/// Кастомный AppBar
class SightListAppBar extends StatelessWidget implements PreferredSizeWidget {
  SightListAppBar({Key key})
      : preferredSize = Size.fromHeight(56),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        height: 56,
        child: Stack(
          children: [
            Center(
              child: Text(
                lblNewPlace,
                style: Theme.of(context).primaryTextTheme.headline4.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: RichText(
                text: TextSpan(
                    text: lblCancel,
                    style:
                        Theme.of(context).primaryTextTheme.bodyText2.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Отмена');
                      }),
              ),

              //
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

/// вывод заголовка для поля ввода
class _AddSightScreenState extends State<AddSightScreen> {
  Widget fieldTitle(
    String caption,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 16,
      child: Text(
        caption,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }

  /// Фокус ноды для соотв. полей
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

  /// Переменные для проверки валидности полей
  bool _isTitleValid = true;
  bool _isDetailValid = true;
  bool _isLatValid = true;
  bool _isLonValid = true;
  bool _isLonEmpty = false;
  bool _isLatEmpty = false;

  bool _allFieldsCorrect = false;

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

    if (_detailController.text == "") {
      setState(() {
        _isDetailValid = false;
      });
    } else {
      setState(() {
        _isDetailValid = true;
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
        setState(() {
          _isLatValid = true;
        });
      }
    }
    setState(() {
      _allFieldsCorrect =
          _isTitleValid & _isDetailValid & _isLatValid & _isLonValid;
    });

    return _allFieldsCorrect;
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

    _titleFocusNode.dispose();
    _lonFocusNode.dispose();
    _latFocusNode.dispose();
    _detailFocusNode.dispose();

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
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
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
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 24),
                              child: Container(
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
                                            .headline1
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                        onChanged: (String text) {
                                          checkValidation();
                                        },
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: fieldTitle(
                                                lblLat,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 12),

                                              /// Поле ввода широты
                                              child: TextField(
                                                focusNode: _latFocusNode,
                                                controller: _latController,
                                                keyboardType:
                                                    TextInputType.number,
                                                textInputAction:
                                                    TextInputAction.next,
                                                autofocus: true,
                                                onEditingComplete: () {
                                                  _lonFocusNode.requestFocus();
                                                  setState(() {});
                                                },
                                                onChanged: (String text) {
                                                  if (text.isEmpty) {
                                                    text = "0";
                                                  }
                                                  checkValidation();
                                                  setState(() {});
                                                },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  errorStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline1
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                            .errorColor,
                                                      ),
                                                  errorText: _isLatEmpty
                                                      ? txtEmptyVal
                                                      : (_isLatValid
                                                          ? null
                                                          : txtWrongRangeLat),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 16,
                                                          top: 11,
                                                          bottom: 12),
                                                  suffixIconConstraints:
                                                      BoxConstraints(
                                                          minHeight: 24,
                                                          minWidth: 24),
                                                  suffixIcon: _latFocusNode
                                                          .hasFocus
                                                      ? IconButton(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxHeight: 20,
                                                                  maxWidth: 20),
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          iconSize: 20,
                                                          icon: svgIcoClear,
                                                          onPressed: () {
                                                            _latController
                                                                .text = "0";
                                                          },
                                                        )
                                                      : null,
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
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: fieldTitle(
                                                lblLong,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 12),

                                              /// Поле для ввода долготы
                                              child: TextField(
                                                focusNode: _lonFocusNode,
                                                controller: _lonController,
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

                                                  checkValidation();
                                                },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,

                                                // Хороший способ отсечь ввод некорректных значений долготы и широты
                                                // onSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                                                // inputFormatters: <TextInputFormatter>[
                                                //   FilteringTextInputFormatter.allow(
                                                //       RegExp(
                                                //           r'^(\+|-)?((\d((\.)|\.\d{1,6})?)|(0*?\d\d((\.)|\.\d{1,6})?)|(0*?1[0-7]\d((\.)|\.\d{1,6})?)|(0*?180((\.)|\.0{1,6})?))$')),
                                                // ],

                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(),
                                                  ),
                                                  errorStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline1
                                                      .copyWith(
                                                        color: Theme.of(context)
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
                                                          top: 11,
                                                          bottom: 12),
                                                  suffixIconConstraints:
                                                      BoxConstraints(
                                                          minHeight: 24,
                                                          minWidth: 24),
                                                  suffixIcon: _lonFocusNode
                                                          .hasFocus
                                                      ? IconButton(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxHeight: 20,
                                                                  maxWidth: 20),
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          iconSize: 20,
                                                          icon: svgIcoClear,
                                                          onPressed: () {
                                                            setState(() {
                                                              _lonController
                                                                  .text = "0";
                                                              checkValidation();
                                                            });
                                                          },
                                                        )
                                                      : null,
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
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 12, right: 24),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 25,
                            child: Text(
                              lblPoint,
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 24,
                          ),
                          child: Container(
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: fieldTitle(
                                  lblDescription,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Container(
                                  height: 80,
                                  padding: EdgeInsets.all(1),

                                  /// Поле ввода ОПИСАНИЕ
                                  child: TextField(
                                    focusNode: _detailFocusNode,
                                    controller: _detailController,
                                    textInputAction: TextInputAction.next,
                                    maxLines: 5,
                                    autofocus: true,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                    onChanged: (String text) {
                                      checkValidation();
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 16,
                                          top: 10,
                                          bottom: 10,
                                          right: 16),
                                      hintText: lblEnterText,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.0,
                          child: FlatButton(
                            autofocus: false,
                            color: _allFieldsCorrect
                                ? Theme.of(context).accentColor
                                : Theme.of(context).backgroundColor,
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
                                    color: _allFieldsCorrect
                                        ? Theme.of(context).primaryColorLight
                                        : Theme.of(context).hintColor,
                                  ),
                            ),
                            onPressed: () {
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
