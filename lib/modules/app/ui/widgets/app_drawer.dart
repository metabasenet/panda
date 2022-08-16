part of app_module;

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _newVersion = false;
  @override
  void initState() {
    // FlutterXUpdate.init(debug: true);
    // _checkNewVersion();
  }

  void _checkNewVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //APP的versionName
    String version = packageInfo.version;
    //APP的versionCode
    String buildNumber = packageInfo.buildNumber;

    if (Platform.isAndroid) {
      var api =
          "https://gitee.com/xuexiangjys/XUpdate/raw/master/jsonapi/update_custom.json";
      final res = await Dio().get(api);
      if (res.statusCode == 200) {
        final serviceCode = res.data["versionCode"] as num;

        if (int.parse(buildNumber) < serviceCode) {
          setState(() {
            _newVersion = true;
          });
        } else {
          setState(() {
            _newVersion = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var debugTabCount = 0;
    return CSDrawer(
      width: 264,
      elevation: 100,
      decoration: AppDrawerBackground(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(24.0),
        ),
      ),
      child: SafeArea(
        child: StoreConnector<AppState, AppCommonVM>(
          distinct: true,
          converter: AppCommonVM.fromStore,
          builder: (context, viewModel) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    debugTabCount++;
                    if (debugTabCount > 10) {
                      showAlertDialog(
                        context,
                        content: viewModel.debugStrings.join('\n\n'),
                        onDismiss: () {
                          copyTextToClipboard(
                            viewModel.debugStrings.join('\n\n'),
                          );
                          Toast.show(tr('global:msg_copy_success'));
                        },
                      );
                    }
                  },
                ),
              ),
              Spacer(),
              AppDrawerMenuLink(
                label: tr('user:menu_website'),
                url: AppLinks.appWebsiteUrl,
              ),
              // AppDrawerMenuLink(
              //   label: tr('user:menu_help'),
              //   url: AppLinks.helpContactUrl(context.locale.languageCode),
              // ),
              AppDrawerMenuTap(
                label: tr('user:menu_help'),
                onPress: () {
                  HelpCenterPage.open();
                },
              ),
              AppDrawerMenuVersion(
                label: tr('user:menu_version'),
                // hasNew: viewModel.hasNewVersion,
                hasNew: _newVersion,
                version: viewModel.appVersion,
                onPressed: () {
                  // UpdatePage.open();
                  // if (_newVersion == true) {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => MhomePage()));
                  // } else {}
                  // FlutterXUpdate.checkUpdate(
                  //     url: _updateUrl,
                  //     themeColor: '#FFFFE0B2',
                  //     topImageRes: 'bg_update_top');
                },
              ),
              AppDrawerMenuLanguage(
                onSelected: (language) {
                  context.setLocale(Locale(language));
                  viewModel.doChangeLanguage(language);
                  AppLanguages.isSetLanguages = true;
                },
              ),
              // if (AppConstants.isBeta)
              //   AppDrawerMenuVersion(
              //     label: 'D- 测试版本',
              //     hasNew: viewModel.hasNewVersion,
              //     version: viewModel.appVersionBeta,
              //     onPressed: () {
              //       LoadingDialog.show(context);
              //       viewModel.doCheckForUpdates(true).then((data) {
              //         LoadingDialog.dismiss(context);
              //         if (data != null) {
              //           showUpdateAppDialog(
              //             context,
              //             downloadUrl: data.downloadUrl,
              //             description: data.description,
              //             version: data.version,
              //           );
              //         } else {
              //           Toast.show(tr('global:update_dialog_msg_last'));
              //         }
              //       }).catchError((error) {
              //         LoadingDialog.dismiss(context);
              //         Toast.showError(error);
              //       });
              //     },
              //   ),
              // if (AppConstants.isBeta)
              //   AppDrawerMenuTap(
              //     label: 'D- 接口服务器配置',
              //     onPress: () {
              //       SettingsDevPage.open();
              //     },
              //   ),
              // if (AppConstants.isBeta)
              //   AppDrawerMenuTap(
              //     label: 'D- 币种链网络配置',
              //     onPress: () {
              //       SettingsTestnetPage.open();
              //     },
              //   ),
              // if (AppConstants.isBeta)
              //   AppDrawerMenuTap(
              //     label: 'D- APP信息',
              //     onPress: () {
              //       showAlertDialog(
              //         context,
              //         content: viewModel.debugStrings.join('\n\n'),
              //         onDismiss: () {
              //           copyTextToClipboard(
              //             viewModel.debugStrings.join('\n\n'),
              //           );
              //           Toast.show(tr('global:msg_copy_success'));
              //         },
              //       );
              //     },
              //   ),
              Spacer(),
              Row(children: const [
                AppDrawerMenuSocial(
                  icon: CSIcons.Twitter,
                  url: AppLinks.appTwitter,
                ),
                AppDrawerMenuSocial(
                  icon: CSIcons.Facebook,
                  url: AppLinks.appFacebook,
                ),
                AppDrawerMenuSocial(
                  icon: CSIcons.Instagram,
                  url: AppLinks.appInstagram,
                ),
                AppDrawerMenuSocial(
                  icon: CSIcons.Telegram,
                  url: AppLinks.appTelegram,
                ),
              ]),
              Padding(
                padding: context.edgeAll.copyWith(top: 0),
                child: Text(
                  tr('user:drawer_copyright'),
                  style: context.textTiny(
                    color: context.labelColor,
                    bold: true,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
