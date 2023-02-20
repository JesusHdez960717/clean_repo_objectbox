import 'dart:async';

import 'package:flutter/services.dart';
export 'src/data/objectbox/data_objectbox_exporter.dart';
export 'src/data/entity/data_entity_exporter.dart';
export 'src/data/repo/data_repo_exporter.dart';

export 'objectbox.g.dart';

class CleanRepoObjectbox {
  static const MethodChannel _channel =
      const MethodChannel('clean_repo_objectbox');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
