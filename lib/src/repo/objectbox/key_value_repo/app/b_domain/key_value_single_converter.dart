abstract class KeyValueSingleConverter<K, V> {
  String keyToString(K key);

  String valueToString(V value);

  K stringToKey(String key);

  V stringToValue(String value);
}
