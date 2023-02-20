import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class BoolDefaultConverter implements SingleKeyValueConverter<String, bool> {
  static final BoolDefaultConverter converter = BoolDefaultConverter._();

  BoolDefaultConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  bool stringToValue(String value) {
    return value == 'true' ? true : false;
  }

  @override
  String valueToString(bool value) {
    return value ? 'true' : 'false';
  }
}
