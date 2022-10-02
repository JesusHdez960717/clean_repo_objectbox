import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class DefaultSingleKeyValueUseCase<K, V> extends SingleKeyValueUseCase<K, V> {
  final K key;
  final V defaultValue;
  final SingleKeyValueRepo repo;

  DefaultSingleKeyValueUseCase(
      {required this.repo, required this.key, required this.defaultValue});

  V read() => repo.read();

  V update(V value) => repo.update(value);

  void destroy() => repo.destroy();
}
