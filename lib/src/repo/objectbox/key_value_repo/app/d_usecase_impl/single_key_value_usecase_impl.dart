import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class SingleKeyValueUseCaseImpl<K, V> extends SingleKeyValueUseCase<K, V> {
  K key;
  V? defaultValue;

  late SingleKeyValueRepo<K, V> _repo;

  SingleKeyValueUseCaseImpl({
    required this.key,
    required SingleKeyValueConverter<K, V> converter,
    this.defaultValue,
  }) {
    _repo = KeyValueRepoModule.buildKeyValueRepo(
      converter: converter,
      key: key,
    );
  }

  V? reset() {
    if (defaultValue != null) {
      return update(defaultValue!);
    } else {
      _repo.destroy();
      return null;
    }
  }

  @override
  void destroy() => _repo.destroy();

  @override
  V? read() {
    V? value = _repo.read();
    return value != null ? value : defaultValue;
  }

  @override
  V update(V value) {
    return _repo.update(value);
  }
}
