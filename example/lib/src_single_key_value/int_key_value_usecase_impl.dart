import 'dart:math';

import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

import 'int_key_value_usecase.dart';

class IntKeyValueUseCaseImpl extends SingleKeyValueUseCaseImpl<String, int>
    implements IntKeyValueUseCase {
  static const String KEY = "INT_KEY";
  static const int DEFAULT_VALUE = 0;

  IntKeyValueUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
          converter: IntDefaultConverter.converter,
        );

  @override
  int changeValue() {
    return update(Random().nextInt(5000));
  }
}
