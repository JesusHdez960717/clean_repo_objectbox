import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class BoolKeyValueConverter implements SingleKeyValueConverter<String, bool> {
  static final BoolKeyValueConverter converter = BoolKeyValueConverter._();

  BoolKeyValueConverter._();

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
