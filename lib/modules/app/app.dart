library app_module;

// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter/services.dart';

// Package imports:
import 'package:amplitude_flutter/amplitude.dart';
import 'package:async_redux/async_redux.dart';
import 'package:async_redux/local_persist.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:convert/convert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter_hooks/flutter_hooks.dart' hide Store;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:network_flutter/network_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart' hide Request;
import 'package:video_player/video_player.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/admission/domain/admission.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/asset/ui/asset.dart';
import 'package:mars/modules/common/domain/common.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/modules/community/domain/community.dart';
import 'package:mars/modules/hdkey/domain/hdkey.dart';
import 'package:mars/modules/home/domain/home.dart';
import 'package:mars/modules/home/ui/home.dart';
import 'package:mars/modules/invest/domain/invest.dart';
import 'package:mars/modules/invest/ui/invest.dart';
import 'package:mars/modules/invitation/domain/invitation.dart';
import 'package:mars/modules/notice/domain/notice.dart';
import 'package:mars/modules/project/domain/project.dart';
import 'package:mars/modules/settings/domain/settings.dart';
import 'package:mars/modules/settings/ui/settings.dart';
import 'package:mars/modules/swap/domain/swap.dart';
import 'package:mars/modules/trade/domain/trade.dart';
import 'package:mars/modules/trade/ui/trade.dart';
import 'package:mars/modules/wallet/domain/wallet.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/common/offline.dart';
import 'package:mars/widgets/widgets.dart';

export 'package:sentry_flutter/sentry_flutter.dart' show SentryFlutter;

export 'setup/app_serializers.dart';

part 'app.g.dart';
part 'config/app_coins.dart';
part 'config/app_config.dart';
part 'config/app_constants.dart';
part 'config/app_languages.dart';
part 'config/app_links.dart';
part 'permission/module_permission.dart';
part 'permission/module_permission_vm.dart';
part 'permission/module_permission_view.dart';
part 'setup/app_actions.dart';
part 'setup/app_errors.dart';
part 'setup/app_getit.dart';
part 'setup/app_hive.dart';
part 'setup/app_localizations.dart';
part 'setup/app_persistor.dart';
part 'setup/app_state.dart';
part 'tracking/analytics.dart';
part 'tracking/crashes.dart';
part 'ui/screens/main_page.dart';
part 'ui/screens/splash_page.dart';
part 'ui/screens/welcome_page.dart';
part 'ui/widgets/app_drawer.dart';
part 'ui/widgets/app_drawer_background.dart';
part 'ui/widgets/app_drawer_menu_lang.dart';
part 'ui/widgets/app_drawer_menu_link.dart';
part 'ui/widgets/app_drawer_menu_social.dart';
part 'ui/widgets/app_drawer_menu_tap.dart';
part 'ui/widgets/app_drawer_menu_version.dart';

Future<void> moduleAppInitGetIt() async {
  GetIt.instance.registerLazySingleton<ModulePermissionUtils>(
    () => ModulePermissionUtils(),
  );
}
