import 'package:clean_core/clean_core.dart';

abstract class SingleKeyValueUseCase<K, V> implements AbstractUseCase {
  V read();

  V update(V value);

  V destroy();

  K get key;

  V get defaultValue;
}
