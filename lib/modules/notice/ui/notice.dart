library notice_ui_module;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/notice/domain/notice.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/widgets/widgets.dart';

part 'screens/notice_detail.dart';
part 'screens/notice_list.dart';
part 'widgets/notice_list_item.dart';

Route<dynamic>? moduleNoticeInitRoutes(RouteSettings settings) {
  switch (settings.name) {
    case NoticeListPage.routeName:
      return NoticeListPage.route(settings);
    case NoticeDetailPage.routeName:
      return NoticeDetailPage.route(settings);
    default:
      return null;
  }
}
