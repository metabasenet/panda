library common_ui_module;

// Dart imports:
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mars/modules/common/ui/screens/update_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';
import 'package:mars/modules/app/app.dart';

part 'dialogs/photo_view_dialog.dart';
part 'screens/help_page.dart';
part 'screens/qr_scanner_page.dart';
part 'screens/webview_page.dart';
part 'widgets/horizontal_progress.dart';
part 'widgets/image_preview.dart';
part 'widgets/qr_code.dart';
part 'widgets/qr_view.dart';
part 'widgets/share_view.dart';
part 'widgets/showcase_view.dart';
part 'widgets/upload_button.dart';
part 'widgets/upload_button_group.dart';

Route? moduleCommonInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case QRScannerPage.routeName:
      return QRScannerPage.route(settings);
    case WebViewPage.routeName:
      return WebViewPage.route(settings);
    case HelpCenterPage.routeName:
      return HelpCenterPage.route(settings);
    case UpdatePage.routeName:
      return UpdatePage.route(settings);
    default:
      return null;
  }
}
