import 'dart:math';

import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

import 'int_key_value_usecase.dart';

class IntKeyValueUseCaseImpl extends DefaultIntKeyValueUseCaseImpl
    implements IntKeyValueUseCase {
  static const String KEY = "INT_KEY";
  static const int DEFAULT_VALUE = 0;

  IntKeyValueUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
        );

  @override
  int changeValue() {
    return update(Random().nextInt(5000));
  }
}
