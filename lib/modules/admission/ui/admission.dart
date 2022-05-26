library admission_ui_module;

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/admission/domain/admission.dart';
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/asset/ui/asset.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';
import 'package:mars/modules/wallet/ui/wallet.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'dialog/admission_submit_dialog.dart';
part 'process/admission_submit_process.dart';
part 'screens/admission_create.dart';
part 'widgets/admission_latest.dart';

Route<dynamic>? moduleAdmissionInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AdmissionCreatePage.routeName:
      return AdmissionCreatePage.route(settings);
    default:
      return null;
  }
}
