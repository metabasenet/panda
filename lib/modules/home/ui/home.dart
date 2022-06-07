library home_ui_module;

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:built_collection/src/list.dart';

// Project imports:
import 'package:mars/dialogs/dialogs.dart';
import 'package:mars/modules/admission/ui/admission.dart';
import 'package:mars/modules/app/app.dart';
import 'package:mars/modules/asset/domain/asset.dart';
import 'package:mars/modules/asset/ui/asset.dart';
import 'package:mars/modules/common/domain/common.dart';
import 'package:mars/modules/common/ui/common.dart';
import 'package:mars/modules/explorer/ui/explorer.dart';
import 'package:mars/modules/home/domain/home.dart';
import 'package:mars/modules/notice/ui/notice.dart';
import 'package:mars/modules/trade/domain/trade.dart';
import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';
import 'package:mars/widgets/widgets.dart';

part 'screens/home_page.dart';
part 'screens/main_tab.dart';
part 'widgets/home_banner.dart';
part 'widgets/home_dot.dart';
part 'widgets/home_prices.dart';
