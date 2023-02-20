abstract class SingleKeyValueConverter<K, V> {
  String keyToString(K key);

  String valueToString(V value);

  V stringToValue(String value);
}
