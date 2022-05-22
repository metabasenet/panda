library widgets;

// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:rxdart/rxdart.dart' hide Notification;
import 'package:scroll_to_index/scroll_to_index.dart';

// Project imports:
//import 'package:mars/dialogs/dialogs.dart';
//import 'package:mars/routers/navigator.dart';
import 'package:mars/themes/themes.dart';
import 'package:mars/utils/utils.dart';

import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

export 'package:pull_to_refresh/pull_to_refresh.dart'
    show RefreshController, SmartRefresher;

part 'progress/progress_indicator.dart';
part 'animation/rive.dart';
part 'animation/rive_toggle.dart';
part 'button/button_utils.dart';
part 'button/button.dart';
part 'button/button_disable_listener.dart';
part 'button/button_group.dart';
part 'button/button_icon.dart';
part 'button/button_menu.dart';

part 'hooks/use_auto_scroll_controller.dart';
part 'hooks/use_behavior_stream.dart';
part 'button/button_tabs.dart';
part 'painter/border.dart';
part 'button/button_tabs_fancy.dart';
part 'button/button_timeout.dart';

part 'common/badge.dart';
part 'common/empty.dart';
part 'common/loadmore.dart';
part 'form/validators.dart';
part 'form/formatters.dart';
part 'form/form_box_field.dart';
part 'form/form_box_password.dart';
part 'form/form_box_phone.dart';
part 'form/form_cell.dart';
part 'image/image.dart';
part 'input/amount_input.dart';
part 'input/amount_select.dart';
part 'input/checkbox.dart';

part 'pincode/pin_theme.dart';
part 'pincode/pin_field.dart';
part 'painter/cursor.dart';
part 'input/pin_code_input.dart';
part 'input/search_input.dart';
part 'input/switch.dart';

part 'layout/container.dart';
part 'layout/drawer.dart';
part 'layout/expansion.dart';
part 'layout/scaffold.dart';
part 'layout/shadow.dart';
part 'layout/title.dart';

part 'listview/listview_delegates.dart';
part 'listview/listview_stream.dart';
part 'listview/listview_footer.dart';
part 'listview/listview_header.dart';
part 'listview/smart_refresher.dart';

part 'painter/check.dart';
part 'painter/circle.dart';
part 'painter/pole.dart';
part 'painter/triangle.dart';
part 'progress/progress_block.dart';

part 'slider/amount_slider.dart';
part 'text/text_adapt.dart';
part 'text/text_size.dart';
part 'text/text_change.dart';

part 'text/text_price.dart';

part 'text/text_price_animated.dart';
part 'text/text_trade_pair.dart';
