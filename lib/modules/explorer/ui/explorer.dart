library explorer_ui_module;

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/modules/explorer/domain/explorer.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'screens/explorer_home.dart';
part 'widgets/explorer_bar.dart';

Route<dynamic> moduleExplorerInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case ExplorerHomePage.routeName:
      return ExplorerHomePage.route(settings);

    default:
      return null;
  }
}
