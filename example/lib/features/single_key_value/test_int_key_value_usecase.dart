import 'dart:math';

import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class TestIntKeyValueUseCase extends IntKeyValueUseCase {
  static const String KEY = "INT_KEY";
  static const int DEFAULT_VALUE = 0;

  TestIntKeyValueUseCase()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
        );

  int changeValue() {
    return update(Random().nextInt(5000));
  }
}
