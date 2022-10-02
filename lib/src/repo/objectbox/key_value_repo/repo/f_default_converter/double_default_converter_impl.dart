import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class FloatDefaultConverter implements SingleKeyValueConverter<String, double> {
  static final FloatDefaultConverter converter = FloatDefaultConverter._();

  FloatDefaultConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  double stringToValue(String value) {
    return double.parse(value);
  }

  @override
  String valueToString(double value) {
    return value.toString();
  }
}
