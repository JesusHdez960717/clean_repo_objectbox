import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

import 'bool_key_value_usecase.dart';

class BoolKeyValueUseCaseImpl extends SingleKeyValueUseCaseImpl<String, bool>
    implements BoolKeyValueUseCase {
  static const String KEY = "BOOL_KEY";
  static const bool DEFAULT_VALUE = false;

  BoolKeyValueUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
          converter: BoolKeyValueConverter.converter,
        );

  @override
  bool changeValue() {
    return update(!read()!);
  }
}
