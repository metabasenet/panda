library invitation_ui_module;

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:network_flutter/network_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/asset/ui/asset.dart';
import 'package:mars/modules/common/domain/common.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/modules/invitation/domain/invitation.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';
import 'package:mars/modules/wallet/ui/wallet.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'dialog/invitation_submit_dialog.dart';
part 'screens/invitation_code.dart';
part 'screens/invitation_coin_select.dart';
part 'screens/invitation_create.dart';
part 'screens/invitation_list.dart';
part 'process/invitation_submit_process.dart';

Route<dynamic>? moduleInvitationInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case InvitationCreatePage.routeName:
      return InvitationCreatePage.route(settings);
    case InvitationListPage.routeName:
      return InvitationListPage.route(settings);
    case InvitationCoinSelectPage.routeName:
      return InvitationCoinSelectPage.route(settings);
    case InvitationCodePage.routeName:
      return InvitationCodePage.route(settings);
    default:
      return null;
  }
}
