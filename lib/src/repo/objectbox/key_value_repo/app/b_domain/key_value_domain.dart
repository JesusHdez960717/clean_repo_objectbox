import 'package:clean_core/clean_core.dart';

class KeyValueDomain<K, V> extends BasicDomainObject {
  int id;
  K key;
  V value;

  KeyValueDomain({required this.key, required this.value, this.id = 0});

  @override
  String toString() {
    return 'KeyValueDomain{id: $id, key: $key, value: $value}';
  }
}
