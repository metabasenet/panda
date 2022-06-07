library swap_ui_module;

// Dart imports:
import 'dart:async';
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/asset/ui/asset.dart';
import 'package:mars/modules/swap/domain/swap.dart';
import 'package:mars/modules/trade/ui/trade.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';
import 'package:mars/modules/wallet/ui/wallet.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'dialogs/swap_submit_dialog.dart';
part 'dialogs/swap_tip_dialog.dart';
part 'screens/swap_create.dart';
part 'screens/swap_list.dart';
part 'widgets/swap_item.dart';
part 'widgets/swap_coin.dart';
part 'widgets/swap_approve_balance.dart';
part 'process/swap_submit_process.dart';

Route<dynamic>? moduleSwapInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SwapCreatePage.routeName:
      return SwapCreatePage.route(settings);
    case SwapListPage.routeName:
      return SwapListPage.route(settings);
    default:
      return null;
  }
}
