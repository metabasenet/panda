library open_ui_module;

// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/open/domain/open.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'dialogs/trans_dialog.dart';
part 'screens/open_webview.dart';

Route<dynamic>? moduleOpenInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case OpenWebViewPage.routeName:
      return OpenWebViewPage.route(settings);
    default:
      return null;
  }
}
