library settings_domain_module;

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Project imports:
import 'package:mars/modules/app/app.dart';

part 'models/settings_config.dart';
part 'services/settings_repository.dart';
part 'settings.g.dart';

const kModuleSettingsSerializeModels = [
  SettingsConfig,
];
