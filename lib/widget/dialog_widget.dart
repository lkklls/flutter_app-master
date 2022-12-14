import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../page_index.dart';

class DialogWidget extends StatefulWidget {
  @override
  createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  String appName;
  String packageName;
  String version;
  String buildNumber;

  @override
  void initState() {
    super.initState();

    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Dialog Widget")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 22.0),
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => NetworkGiffyDialog(
                        image: Image.network(
                          "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Granny Eating Chocolate',
                          textAlign: TextAlign.center,
                          style: dialogTextStyle,
                        ),
                        description: Text(
                          'This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog.',
                          textAlign: TextAlign.center,
                        ),
                        onOkButtonPressed: () {},
                      ));
            },
            child: Text('Network giffy dialog'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                        image: Image.asset(
                          'images/timg.gif',
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Men Wearing Jackets',
                          style: dialogTextStyle,
                        ),
                        description: Text(
                          'This is a men wearing jackets dialog box. This library helps you easily create fancy giffy dialog.',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                        onOkButtonPressed: () {},
                      ));
            },
            child: Text('Asset giffy dialog'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    title: Text('??????'),
                    //??????
                    titlePadding: EdgeInsets.all(20),
                    //?????????padding???
                    content: Text(
                      '?????????????????????Flutter',
                      style: dialogTextStyle,
                    ),
                    //????????????????????????
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    //?????????padding???
                    actions: <Widget>[
                      //??????????????????
                      TextButton(
                        onPressed: () {
                          print("??????");
                          Navigator.pop(context);
                        },
                        child: Text('??????'),
                      ),
                      TextButton(
                        onPressed: () {
                          print('??????');
                          Navigator.pop(context);
                        },
                        child: Text('??????'),
                      ),
                    ],
                  );
                },
                barrierDismissible: false,
              );
            },
            child: Text("AlertDialog"),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Info', style: dialogTextStyle), //??????
                      titlePadding: EdgeInsets.all(20), //?????????padding???
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.account_circle),
                          ),
                          title: Text('username@gmail.com'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.account_balance),
                          ),
                          title: Text('user02@gmail.com'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add_circle),
                          ),
                          title: Text('add account'),
                          onTap: null,
                        ),
                      ],
                      contentPadding: EdgeInsets.all(0),
                    );
                  });
            },
            child: Text("SimpleDialog"),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  // ???????????? dialog ??????????????? dialog?????????????????????
                  barrierDismissible: false,
                  builder: (context) {
                    return AboutDialog(
                      applicationName: '$appName',
                      applicationIcon: Image.asset('images/flutter_logo.png',
                          width: 60.0, height: 60.0),
                      applicationVersion: '$version',
                      //????????????????????????
                      applicationLegalese: '???????????????SCL',
                      children: <Widget>[
                        Text("???????????????"),
                        Text('???????????????'),
                      ],
                    );
                  });
            },
            child: Text("AboutDialog"),
          ),
          Divider(),
          AboutListTile(
              icon: CircleAvatar(
                  child: Icon(Icons.update, color: Colors.white, size: 20.0),
                  maxRadius: 15),
              child: Text('AboutListTile'),
              applicationName: '$appName',
              applicationIcon: Image.asset('images/flutter_logo.png',
                  width: 60.0, height: 60.0),
              applicationVersion: '$version',
              //????????????????????????
              applicationLegalese: '???????????????SCL',
              aboutBoxChildren: <Widget>[
                Text("BoxChildren"),
                Text("box child 2")
              ]),
          Divider(),
          ElevatedButton(
            onPressed: () {
              _showStatefulWidgetDialog(context);
            },
            child: Text('ProgressDialog'),
          ),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BaseDialog(
                          Column(children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text("?????????Dialog",
                                    style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 2,
                                        color:
                                            Theme.of(context).primaryColor))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text("Hello ?????????Dialog"))),
                            Container(
                                height: 50,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(this);
                                          },
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              alignment: Alignment.center,
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.4),
                                                        Theme.of(context)
                                                            .primaryColor
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Text("??????",
                                                  style: TextStyle(
                                                      letterSpacing: 3,
                                                      color: Colors.white))))
                                    ]))
                          ]),
                          140,
                          MediaQuery.of(context).size.width * .6);
                    });
              },
              child: Text('?????????Dialog')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    // Dialog ????????????
                    barrierColor: Colors.grey.withOpacity(.4),
                    // ?????? Dialog ????????????
                    barrierDismissible: true,
                    barrierLabel: "",
                    // Dialog ??????????????????????????????????????????????????????
                    transitionDuration: Duration(milliseconds: 400),
                    // RouteTransitionsBuilder ????????????????????????????????? Dialog ????????????
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.rotate(
                          angle: anim1.value * 360,
                          child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world")));
                    });
              },
              child: Text('????????????Dialog')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.scale(
                          scale: anim1.value,
                          child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world")));
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return;
                    });
              },
              child: Text('????????????Dialog')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.rotate(
                          angle: anim1.value * 360,
                          child: Opacity(
                              opacity: anim1.value,
                              child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  title: Text("Dialog"),
                                  content: Text("Hello world"))));
                    });
              },
              child: Text('??????+????????????Dialog')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.scale(
                          scale: anim1.value,
                          child: Opacity(
                            opacity: anim1.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world"),
                            ),
                          ));
                    });
              },
              child: Text('??????+????????????Dialog')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(anim1.value) - 1.0;
                      return Transform(
                          transform: Matrix4.translationValues(
                              0.0, curvedValue * 200, 0.0),
                          child: Opacity(
                            opacity: anim1.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world"),
                            ),
                          ));
                    });
              },
              child: Text('??????????????????Dialog')),
          Divider(),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('????????????'),
                    action: SnackBarAction(label: '??????', onPressed: () {}),
                    duration: Duration(milliseconds: 2000)));
              },
              child: Text('SnackBar'),
            ),
          ),
          Divider(),
          CupertinoButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('??????'),
                      //????????????
                      content: Text('?????????????????????Flutter', style: dialogTextStyle),
                      //????????????
                      actions: <Widget>[
                        //????????????
                        CupertinoDialogAction(
                          onPressed: () {
                            //??????????????????
                            print("??????????????????");
                            Navigator.pop(context, "??????");
                          },
                          child: Text('??????'), //??????????????????
                          isDefaultAction: true,
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            print("?????????");
                            Navigator.pop(context, "??????");
                          },
                          child: Text('??????'),
                          isDestructiveAction: true,
                        ),
                      ],
                    );
                  });
            },
            child: Text("CupertinoAlertDialog"),
            color: CupertinoColors.activeBlue,
          ),
          Divider(),
          CupertinoButton(
            child: const Text('Alert with Title'),
            color: CupertinoColors.activeBlue,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(
                      'Allow "Maps" to access your location while you are using the app?',
                      style: dialogTextStyle),
                  content: Text(
                      'Your current location will be displayed on the map and used '
                      'for directions, nearby search results, and estimated travel times.',
                      style: dialogTextStyle),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Don\'t Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Disallow');
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Allow');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          CupertinoButton(
              child: const Text('Alert with Buttons'),
              color: CupertinoColors.activeBlue,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                      title: Text('Select Favorite Dessert'),
                      content: Text(
                          'Please select your favorite type of dessert from the'
                          'list below.Your selection will be used to customize the suggested list of eateries in your area.',
                          style: dialogTextStyle),
                      actions: items(context)))),
          Divider(),
          CupertinoButton(
              child: const Text('Alert Buttons Only'),
              color: CupertinoColors.activeBlue,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) =>
                      CupertinoAlertDialog(actions: items(context)))),
          Divider(),
          CupertinoButton(
            child: const Text('Action Sheet'),
            color: CupertinoColors.activeBlue,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showCupertinoModalPopup<String>(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                      title: const Text('Favorite Dessert'),
                      message: Text(
                          'Please select the best dessert from the options below.',
                          style: dialogTextStyle),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: const Text('Profiteroles'),
                          onPressed: () {
                            Navigator.pop(context, 'Profiteroles');
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Cannolis'),
                          onPressed: () {
                            Navigator.pop(context, 'Cannolis');
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Trifle'),
                          onPressed: () {
                            Navigator.pop(context, 'Trifle');
                          },
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('Cancel'),
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                      )));
            },
          ),
        ],
      ),
    );
  }

  List<Widget> items(context) {
    List<Widget> widgets = [
      CupertinoDialogAction(
        child: const Text('Cheesecake'),
        onPressed: () {
          Navigator.pop(context, 'Cheesecake');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Tiramisu'),
        onPressed: () {
          Navigator.pop(context, 'Tiramisu');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Apple Pie'),
        onPressed: () {
          Navigator.pop(context, 'Apple Pie');
        },
      ),
      CupertinoDialogAction(
        child: const Text("Devil's food cake"),
        onPressed: () {
          Navigator.pop(context, "Devil's food cake");
        },
      ),
      CupertinoDialogAction(
        child: const Text('Banana Split'),
        onPressed: () {
          Navigator.pop(context, 'Banana Split');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Oatmeal Cookie'),
        onPressed: () {
          Navigator.pop(context, 'Oatmeal Cookies');
        },
      ),
      CupertinoDialogAction(
          child: const Text('Chocolate Brownie'),
          onPressed: () => Navigator.pop(context, 'Chocolate Brownies')),
      CupertinoDialogAction(
          child: const Text('Cancel'),
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context, 'Cancel'))
    ];
    return widgets;
  }

  _showStatefulWidgetDialog(BuildContext context) {
    var progress = 0.0;
    StateSetter stateSetter;

    Timer.periodic(Duration(milliseconds: 200), (timer) {
      // ???????????????????????????
      progress += 0.01;
      if (stateSetter != null) {
        stateSetter(() {});
      }
      if (progress >= 1) {
        timer.cancel();
        stateSetter = null;
        Navigator.of(context).pop();
      }
    });

    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (ctx, state) {
              stateSetter = state;
              return Center(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Card(
                          elevation: 24.0,
                          color: Colors.blue.withAlpha(240),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                    value: progress),
                                Gaps.vGap20,
                                Text("Loading...",
                                    style: TextStyle(color: Colors.white)),
                                Gaps.vGap5,
                                Text(
                                    "done ${((progress) * 100).toStringAsFixed(1)}%",
                                    style: TextStyle(color: Colors.white))
                              ]))));
            }),
        // ??????dialog??????????????????dialog
        barrierDismissible: false);
  }

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });

    debugPrint(
        'APP?????????$appName-====?????????$packageName=====????????????$version======????????????$buildNumber');
  }
}

class BaseDialog extends Dialog {
  //?????????
  final Widget widget;

  // ???
  final double height;

  //???
  final double width;

  BaseDialog(this.widget, this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Material(
                type: MaterialType.transparency,
                child: new Container(
                    height: this.height,
                    width: this.width,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                    child: this.widget))));
  }
}
