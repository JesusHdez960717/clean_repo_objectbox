import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class SingleKeyValueUseCaseImpl<K, V> extends SingleKeyValueUseCase<K, V> {
  K key;
  V? defaultValue;

  late SingleKeyValueRepo<K, V> _repo;
  late SingleKeyValueConverter<K, V> _converter;

  SingleKeyValueUseCaseImpl({
    required this.key,
    required SingleKeyValueConverter<K, V> converter,
    this.defaultValue,
  }) {
    _converter = converter;
    _repo = KeyValueRepoModule.buildKeyValueRepo(
      converter: converter,
      key: key,
    );
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
