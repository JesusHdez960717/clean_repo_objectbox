import 'package:clean_core/clean_core.dart';

class KeyValueDomain extends BasicDomainObject {
  int id;
  String key;
  Object value;

  KeyValueDomain({required this.key, required this.value, this.id = 0});

  @override
  String toString() {
    return 'KeyValueDomain{id: $id, key: $key, value: $value}';
  }
}
