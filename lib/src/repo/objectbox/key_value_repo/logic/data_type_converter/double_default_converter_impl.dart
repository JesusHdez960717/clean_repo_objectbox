import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DoubleDefaultConverter implements SingleKeyValueConverter<String, double> {
  static final DoubleDefaultConverter converter = DoubleDefaultConverter._();

  DoubleDefaultConverter._();

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
