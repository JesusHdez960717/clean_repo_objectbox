
abstract class SingleKeyValueUseCase<K, V> {
  V? read();

  V update(V value);

  void destroy();

  K get key;

  V? get defaultValue;
}
