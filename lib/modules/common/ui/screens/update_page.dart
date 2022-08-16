import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);
  static const routeName = '/common/update';
  static void open() {
    AppNavigator.push(routeName);
  }

  static Route<dynamic> route(RouteSettings settings) {
    return DefaultTransition(
      settings,
      UpdatePage(),
    );
  }

  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String promptText = '';
  String? _serviceVersionUrl;
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 3), (){
    //     _checkVersion();
    // });
    _checkVersion();
  }

  void _checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //versionName
    String version = packageInfo.version;
    //versionCode
    String buildNumber = packageInfo.buildNumber;

    if (Platform.isAndroid) {
      var api =
          "https://gitee.com/xuexiangjys/XUpdate/raw/master/jsonapi/update_custom.json";
      final res = await Dio().get(api);

      if (res.statusCode == 200) {
        final serviceCode = res.data["versionCode"] as num;
        final String _serviceVersionApp = res.data["updateLog"] as String;

        _serviceVersionUrl = res.data["apkUrl"] as String;

        if (int.parse(buildNumber) < serviceCode) {
          showDialog(
              context: context,
              //强制更新，不可以点击空白区域关闭，不需要时可以不要
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.yellow.shade50,
                  title: Text(tr('user:version_update_diolog_title')),
                  // content: Text(tr('user:version_update_diolog_content')),
                  content: Text(_serviceVersionApp),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(tr('user:version_update_diolog_action_left')),
                      onPressed: () {
                        this._launcherApp();
                      },
                    ),
                    FlatButton(
                      child:
                          Text(tr('user:version_update_diolog_action_right')),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        } else {
          if (context.locale.languageCode == 'zh') {
            setState(() {
              promptText = '当前已是最新版本';
            });
          } else if (context.locale.languageCode == 'en') {
            setState(() {
              promptText = 'It is currently the latest version';
            });
          }
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         backgroundColor: Colors.yellow.shade50,
          //         title: Text(tr('user:version_update_diolog_title')),
          //         // content: Text(tr('user:version_update_diolog_content')),
          //         content: Text('当前已是最新版本'),
          //         actions: <Widget>[
          //           FlatButton(
          //             child: Text(tr('确定')),
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //           )
          //         ],
          //       );
          //     });
        }
      } else {}
    }
  }

  _launcherApp() async {
    if (Platform.isAndroid) {
      // var url = "https://browser.metabasenet.site/api/file/6vck39eqn4.apk";
      if (true) {
        await launch(_serviceVersionUrl!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CSScaffold(
        headerBgColor: context.primaryColor,
        backgroundColor: context.whiteColor,
        child: Column(
          children: [
            Container(
              color: context.primaryColor,
              child: Transform.translate(
                offset: Offset(0, context.edgeSize),
                child: Container(
                  color: context.primaryColor,
                  padding: context.edgeAll.copyWith(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr('user:version_update_title'),
                        style: context.textHuge(
                          bold: true,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      CSImage(
                        'assets/images/help_bg.png',
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 270,
            ),
            Text(promptText),
          ],
        ));
  }
}
