import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class TestBoolKeyValueUseCase extends BoolKeyValueUseCase {
  static const String KEY = "BOOL_KEY";
  static const bool DEFAULT_VALUE = false;

  TestBoolKeyValueUseCase()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
        );

  bool changeValue() {
    return toggleValue()!;
  }
}
