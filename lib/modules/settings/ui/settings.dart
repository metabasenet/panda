library settings_ui_module;

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:network_flutter/network_flutter.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/invitation/domain/invitation.dart';
import 'package:mars/modules/open/ui/open.dart';
import 'package:mars/modules/settings/domain/settings.dart';
import 'package:mars/modules/trade/domain/trade.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'screens/settings_dev.dart';
part 'screens/settings_testnet.dart';

Route<dynamic>? moduleSettingsInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SettingsDevPage.routeName:
      return SettingsDevPage.route(settings);
    case SettingsTestnetPage.routeName:
      return SettingsTestnetPage.route(settings);
    default:
      return null;
  }
}
