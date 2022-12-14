import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget> {
  String _buttonType;

  /// add line
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool mini = false;
  bool extended = false;

  @override
  Widget build(BuildContext context) {
    Widget bodyView;

    switch (_buttonType) {
      case 'CUPERTINO':
        bodyView = buildCupertinoButton();
        break;
      case 'ICON':
        bodyView = buildIconButton();
        break;
      case 'ACTION':
        bodyView = buildFAButton();
        break;
      case 'DROPDOWN':
        bodyView = buildDropdownButton();
        break;
      case 'OUTLINE':
        bodyView = buildOutlineButton();
        break;
      case 'FLAT':
        bodyView = buildFlatButton();
        break;
      case 'MATERIAL':
        bodyView = buildMaterialButton();
        break;
      default:
        bodyView = buildRaisedButton();
        break;
    }

    return Scaffold(
      /// add line
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Button Widget"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _buttonType = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                value: 'MATERIAL',
                child: Text('MaterialButton'),
              ),
              PopupMenuItem<String>(
                value: 'RAISED',
                child: Text('RAISED BUTTON'),
              ),
              PopupMenuItem<String>(
                value: 'FLAT',
                child: Text('FLAT BUTTON'),
              ),
              PopupMenuItem<String>(
                value: 'OUTLINE',
                child: Text('OUTLINE BUTTON'),
              ),
              PopupMenuItem<String>(
                value: 'ICON',
                child: Text('ICON BUTTON'),
              ),
              PopupMenuItem<String>(
                value: 'ACTION',
                child: Text('FloatingActionButton'),
              ),
              PopupMenuItem<String>(
                value: 'DROPDOWN',
                child: Text('DROPDOWN BUTTON'),
              ),
              PopupMenuItem<String>(
                value: 'CUPERTINO',
                child: Text('CUPERTINO BUTTON'),
              ),
            ],
          )
        ],
      ),
      body: Center(child: bodyView),
      floatingActionButton: _buttonType == 'ACTION'
          ? extended
              ? FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      extended = false;
                    });
                  },
                  icon: Icon(Icons.android),
                  label: Text('Android'))
              : FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      extended = true;
                    });
                  },
                  child: Icon(Icons.android),
                  tooltip: 'FloatingActionButton ToolTip',
                )
          : null,
    );
  }

  //  ButtonTextTheme textTheme,          // ??????????????????
  //      Color textColor,                    // ???????????????
  //  Color disabledTextColor,            // ??????????????????????????????
  //      Color color,                        // ???????????????
  //  Color disabledColor,                // ??????????????????????????????
  //      Color highlightColor,               // ??????????????????????????????
  //  Color splashColor,                  // ???????????????
  //      Brightness colorBrightness,         // ???????????????
  //  double elevation,                   // ????????????
  //      double highlightElevation,          // ?????????????????????
  //  double disabledElevation,           // ???????????????????????????
  //      EdgeInsetsGeometry padding,         // ?????????????????????
  //  ShapeBorder shape,                  // ????????????
  //      Clip clipBehavior,      // ?????????????????????
  //  MaterialTapTargetSize materialTapTargetSize,
  //      Duration animationDuration,         // ????????????
  Widget buildRaisedButton() {
    return Align(
      alignment: const Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                child: const Text('RAISED BUTTON',
                    semanticsLabel: 'RAISED BUTTON 1'),
                onPressed: () {
                  // Perform some action
                  _displaySnackBar();
                },
                //shape: const StadiumBorder(),
              ),
              ElevatedButton(
                child: Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 1'),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                  child: Text('R.nomal'),
                  //textTheme: ButtonTextTheme.normal,
                  onPressed: () {}),
              ElevatedButton(
                  child: Text('R.primary'),
                  // textTheme: ButtonTextTheme.primary,
                  onPressed: () {}),
              ElevatedButton(
                  child: Text('R.accent'),
                  //textTheme: ButtonTextTheme.accent,
                  onPressed: () {})
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('RAISED BUTTON',
                    semanticsLabel: 'RAISED BUTTON 2'),
                onPressed: () {
                  // Perform some action
                  _displaySnackBar();
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label:
                    const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 2'),
                onPressed: null,
                //shape: const StadiumBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //  ButtonTextTheme textTheme,          // ??????????????????
  //      Color textColor,                    // ???????????????
  //  Color disabledTextColor,            // ??????????????????????????????
  //      Color color,                        // ???????????????
  //  Color disabledColor,                // ??????????????????????????????
  //      Color highlightColor,               // ??????????????????????????????
  //  Color splashColor,                  // ???????????????
  //      Brightness colorBrightness,         // ???????????????
  //  EdgeInsetsGeometry padding,         // ?????????????????????
  //      ShapeBorder shape,                  // ????????????
  //  Clip clipBehavior = Clip.none,      // ?????????????????????
  Widget buildFlatButton() {
    return Align(
      alignment: const Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                child:
                    const Text('FLAT BUTTON', semanticsLabel: 'FLAT BUTTON 1'),
                onPressed: () {
                  // Perform some action
                  _displaySnackBar();
                },
                //shape: const StadiumBorder(),
              ),
              ElevatedButton(
                child: Text(
                  'DISABLED',
                  semanticsLabel: 'DISABLED BUTTON 3',
                ),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                  child: Text('F.nomal'),
                  // textTheme: ButtonTextTheme.normal,
                  onPressed: () {}),
              ElevatedButton(
                  child: Text('F.primary'),
                  //textTheme: ButtonTextTheme.primary,
                  onPressed: () {}),
              ElevatedButton(
                  child: Text('F.accent'),
                  // textTheme: ButtonTextTheme.accent,
                  onPressed: () {}),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.add_circle_outline, size: 18.0),
                label:
                    const Text('FLAT BUTTON', semanticsLabel: 'FLAT BUTTON 2'),
                onPressed: () {
                  // Perform some action
                  _displaySnackBar();
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add_circle_outline, size: 18.0),
                label:
                    const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 4'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //  ButtonTextTheme textTheme,          // ??????????????????
  //      Color textColor,                    // ????????????
  //  Color disabledTextColor,            // ???????????????????????????
  //      Color color,                        // ???????????????
  //  Color highlightColor,               // ???????????????
  //      Color splashColor,                  // ???????????????
  //  double highlightElevation,          // ?????????????????????
  //  this.borderSide,                    // ????????????
  //  this.disabledBorderColor,           // ???????????????????????????
  //  this.highlightedBorderColor,        // ?????????????????????
  //  EdgeInsetsGeometry padding,         // ??????????????????
  //      ShapeBorder shape,                  // ????????????
  //  Clip clipBehavior = Clip.none,      // ?????????????????????
  Widget buildOutlineButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              child: const Text('OUTLINE BUTTON',
                  semanticsLabel: 'OUTLINE BUTTON 1'),
              onPressed: () {
                // Perform some action
              },
              //shape: const StadiumBorder(),
            ),
            OutlinedButton(
              child: Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 5'),
              onPressed: null,
            ),
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                child: Text('O.nomal'),
                // textTheme: ButtonTextTheme.normal,
                onPressed: () {}),
            ElevatedButton(
                child: Text('O.primary'),
                //textTheme: ButtonTextTheme.primary,
                onPressed: () {}),
            ElevatedButton(
                child: Text('O.accent'),
                //textTheme: ButtonTextTheme.accent,
                onPressed: () {})
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlinedButton.icon(
              icon: const Icon(Icons.add, size: 18.0),
              label: const Text('OUTLINE BUTTON',
                  semanticsLabel: 'OUTLINE BUTTON 2'),
              onPressed: () {
                // Perform some action
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, size: 18.0),
              label:
                  const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 6'),
              onPressed: null,
              //shape: const StadiumBorder(),
            ),
          ],
        ),
      ],
    );
  }

  //  iconSize,   // ????????????
  //  padding,   // ??????????????????
  //  alignment,          // ????????????
  //  icon,    // ????????????
  //  color,             // ????????????
  //  highlightColor,    // ??????????????????
  //  splashColor,       // ???????????????
  //  disabledColor,     // ???????????????????????????
  //  tooltip            // ????????????
  Widget buildIconButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonBar(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.thumb_up, semanticLabel: 'Thumbs up'),
              // ????????????
              iconSize: 48,
              // ??????????????????
              padding: EdgeInsets.all(10),
              onPressed: () {},
              // ????????????
              color: Colors.redAccent,
              // ??????????????????
              highlightColor: Colors.green,
              // ???????????????
              splashColor: Colors.pinkAccent,
              // ????????????
              tooltip: '???????',
            ),
            const IconButton(
              icon: Icon(Icons.thumb_up, semanticLabel: 'Thumbs not up'),
              onPressed: null,
              // ???????????????????????????
              disabledColor: Colors.orange,
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        ButtonBar(mainAxisSize: MainAxisSize.min, children: <Widget>[
          CloseButton(),
          BackButton(),
          BackButton(
            color: Colors.redAccent,
          )
        ]),
      ],
    );
  }

  //    this.tooltip,                           // ????????????
  //    this.foregroundColor,                   // ????????????????????????
  //    this.backgroundColor,                   // ?????????
  //    this.heroTag, // Hero ????????????
  //    this.elevation,                   // ??????
  //    this.highlightElevation,         // ???????????????
  //    this.mini,                      // ????????????????????? mini ??? default
  //    this.shape,      // ????????????
  //    this.clipBehavior,          // ?????????????????????
  //    this.materialTapTargetSize,             // ???????????????????????????
  //    this.isExtended,                // ???????????? .extended ??????
  Widget buildFAButton() {
    return FloatingActionButton(
      mini: mini,
      onPressed: () {
        setState(() {
          mini = !mini;
        });
      },
      child: Icon(Icons.android),
      tooltip: 'FloatingActionButton ToolTip',
      foregroundColor: Colors.redAccent.withOpacity(0.7),
      backgroundColor: Colors.green.withOpacity(0.4),
      elevation: 0.0,
      highlightElevation: 10.0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      clipBehavior: Clip.antiAlias,
      heroTag: 'FloatingActionButton',
    );
  }

  String dropdown1Value = 'Three';
  String dropdown2Value;
  String dropdown3Value = 'Four';

  Widget buildDropdownButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text('Simple dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown1Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown1Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Dropdown with a hint:'),
            trailing: DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String newValue) {
                setState(() {
                  dropdown2Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Scrollable dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown3Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown3Value = newValue;
                });
              },
              items: <String>[
                'One',
                'Two',
                'Three',
                'Four',
                'Can',
                'I',
                'Have',
                'A',
                'Little',
                'Bit',
                'More',
                'Five',
                'Six',
                'Seven',
                'Eight',
                'Nine',
                'Ten'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCupertinoButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: const Alignment(0.0, -0.2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CupertinoButton(
                  child: const Text('Cupertino Button'), onPressed: () {}),
              const CupertinoButton(
                child: Text('Disabled'),
                onPressed: null,
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(12.0)),
        CupertinoButton(
            child: const Text('With Background'),
            color: CupertinoColors.activeBlue,
            onPressed: () {}),
        const Padding(padding: EdgeInsets.all(12.0)),
        const CupertinoButton(
          child: Text('Disabled'),
          color: CupertinoColors.activeBlue,
          onPressed: null,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ],
    );
  }

  void _displaySnackBar() {
    /// show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        /// set content of snackbar
        content: Text(
          "Hello! I am SnackBar :)",
        ),

        /// set duration
        duration: Duration(seconds: 3),

        /// set the action
        action: SnackBarAction(
          label: "Hit Me (Action)",
          onPressed: () {
            /// When action button is pressed, show another snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Hello! I am shown becoz you pressed Action :)",
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //  onHighlightChanged,        // ?????????????????????
  //  textTheme,                 // ????????????
  //  textColor,                 // ????????????
  //  disabledTextColor,         // ???????????????????????????
  //  color,                     // ?????????
  //  disabledColor,             // ????????????????????????
  //  highlightColor,            // ????????????????????????
  //  splashColor,               // ???????????????
  //  colorBrightness,
  //  elevation,                 // ????????????
  //  highlightElevation,        // ?????????????????????
  //  disabledElevation,         // ???????????????????????????
  //  padding,                   // ??????????????????
  //  shape,                     // ????????????
  //  clipBehavior,  // ?????????????????????
  //  materialTapTargetSize,     // ???????????????????????????
  //  animationDuration,         // ????????????????????????
  //  minWidth,                  // ????????????
  //  height,                    // ????????????
  Widget buildMaterialButton() {
    return MaterialButton(
      color: Colors.teal.withOpacity(0.4),
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text('MaterialButton'),
      onPressed: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      clipBehavior: Clip.none,
    );
  }
}
