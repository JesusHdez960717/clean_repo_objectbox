import 'dart:async';

import 'package:flutter/services.dart';
export 'src/data/data_exporter.dart';

export 'src/key_value/key_value_exporter.dart';

export 'objectbox.g.dart';

class CleanRepoObjectbox {
  static const MethodChannel _channel =
      const MethodChannel('clean_repo_objectbox');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
