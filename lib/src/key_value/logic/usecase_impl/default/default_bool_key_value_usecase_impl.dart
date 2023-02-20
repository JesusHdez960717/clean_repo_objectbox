import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DefaultBoolKeyValueUseCaseImpl extends SingleKeyValueUseCaseImpl<String, bool> {

  DefaultBoolKeyValueUseCaseImpl({
    required String key,
    bool? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: BoolDefaultConverter.converter,
        );

  bool? toggleValue() {
    bool? value = read();
    if (value != null) {
      return update(!value);
    } else if (defaultValue != null) {
      return update(!defaultValue!);
    }
    return null;
  }
}
