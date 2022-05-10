library explorer_domain_module;

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:built_value/built_value.dart';
import 'package:sprintf/sprintf.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';

part 'logic/explorer_home_vm.dart';
part 'models/explorer_config.dart';
part 'utils/explorer_utils.dart';
part 'explorer.g.dart';

Future<void> moduleExplorerInitHive() async {
  //
}

Future<void> moduleExplorerInitGetIt() async {
  //
}

const kModuleExplorerSerializeModels = [
  //
];
