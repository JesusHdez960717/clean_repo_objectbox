import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/app/key_value_app_exporter.dart';

class SingleKeyValueUseCaseImpl<K, V> extends SingleKeyValueUseCase<K, V> {
  SingleKeyValueRepo<K, V> repo;
  K key;
  V defaultValue;

  SingleKeyValueUseCaseImpl({
    required this.repo,
    required this.key,
    required this.defaultValue,
  });

  @override
  V destroy() {
    V? value = repo.destroy();
    return value != null ? value : defaultValue;
  }

  @override
  V read() {
    V? value = repo.read();
    return value != null ? value : defaultValue;
  }

  @override
  V update(V value) {
    return repo.update(value);
  }
}
