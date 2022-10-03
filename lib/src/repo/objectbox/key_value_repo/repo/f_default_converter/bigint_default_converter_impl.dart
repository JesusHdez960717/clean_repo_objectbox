import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class BigIntDefaultConverter implements SingleKeyValueConverter<String, BigInt> {
  static final BigIntDefaultConverter converter = BigIntDefaultConverter._();

  BigIntDefaultConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  BigInt stringToValue(String value) {
    return BigInt.parse(value);
  }

  @override
  String valueToString(BigInt value) {
    return value.toString();
  }
}
