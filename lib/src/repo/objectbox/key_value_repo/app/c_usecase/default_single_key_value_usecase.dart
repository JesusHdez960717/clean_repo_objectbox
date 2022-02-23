import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/app/key_value_app_exporter.dart';

class DefaultSingleKeyValueUseCase<K, V> extends SingleKeyValueUseCase<K, V> {
  final K key;
  final V defaultValue;
  final SingleKeyValueRepo repo;

  DefaultSingleKeyValueUseCase(
      {required this.repo, required this.key, required this.defaultValue});

  V read() => repo.read();

  V update(V value) => repo.update(value);

  V destroy() => repo.destroy();
}
