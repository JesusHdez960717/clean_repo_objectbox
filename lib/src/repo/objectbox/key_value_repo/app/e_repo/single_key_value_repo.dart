import 'package:clean_core/clean_core.dart';

abstract class SingleKeyValueRepo<K, V> implements AbstractUseCase {
  V? read();

  V update(V value);

  V? destroy();

  K get key;
}
