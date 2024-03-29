import 'dart:async';

import 'package:flutter/services.dart';
export 'src/repo/objectbox/objectbox_repo_exporter.dart';

export 'objectbox.g.dart';

class CleanRepoObjectbox {
  static const MethodChannel _channel =
      const MethodChannel('clean_repo_objectbox');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
