library open_domain_module;

// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:built_value/built_value.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';

part 'logic/open_webview_vm.dart';
part 'store/open_actions.dart';
part 'utils/js_bridge.dart';
part 'utils/js_methods.dart';
part 'open.g.dart';

Future<void> moduleOpenInitHive() async {
//
}

Future<void> moduleOpenInitGetIt() async {
  //
}

const kModuleOpenSerializeModels = [
  //
];
