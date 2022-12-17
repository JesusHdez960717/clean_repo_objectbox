import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

import 'bool_key_value_usecase.dart';

class BoolKeyValueUseCaseImpl extends DefaultBoolKeyValueUseCaseImpl
    implements BoolKeyValueUseCase {
  static const String KEY = "BOOL_KEY";
  static const bool DEFAULT_VALUE = false;

  BoolKeyValueUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
        );

  @override
  bool changeValue() {
    return toggleValue()!;
  }
}
