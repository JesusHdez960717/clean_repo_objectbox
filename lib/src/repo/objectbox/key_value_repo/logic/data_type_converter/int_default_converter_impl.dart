import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class IntDefaultConverter implements SingleKeyValueConverter<String, int> {
  static final IntDefaultConverter converter = IntDefaultConverter._();

  IntDefaultConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  int stringToValue(String value) {
    return int.parse(value);
  }

  @override
  String valueToString(int value) {
    return value.toString();
  }
}
