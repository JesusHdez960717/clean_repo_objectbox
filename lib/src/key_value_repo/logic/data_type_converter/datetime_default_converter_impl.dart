import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DateTimeDefaultConverter implements SingleKeyValueConverter<String, DateTime> {
  static final DateTimeDefaultConverter converter = DateTimeDefaultConverter._();

  DateTimeDefaultConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  DateTime stringToValue(String value) {
    return DateTime.parse(value);
  }

  @override
  String valueToString(DateTime value) {
    return value.toString();
  }
}
