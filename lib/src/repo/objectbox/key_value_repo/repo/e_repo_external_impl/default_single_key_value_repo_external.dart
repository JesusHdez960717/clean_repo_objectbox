import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/key_value_exporter.dart';
import 'package:objectbox/objectbox.dart';

class DefaultSingleKeyValueRepoExternal extends SingleKeyValueRepoExternal {
  final Box<KeyValueEntity> _box;
  final String key;

  DefaultSingleKeyValueRepoExternal(Store _store, this.key)
      : _box = Box<KeyValueEntity>(_store);

  Box<KeyValueEntity> get box => _box;

  @override
  String? read() {
    return _read()?.value;
  }

  @override
  String update(String value) {
    //busco el entity ya existente
    final entity = _read();

    //si devuelve null es que no existe, entonces inserto uno nuevo
    if (entity == null) {
      _box.put(
        KeyValueEntity(key, value),
      );
    } else {
      //si ya existe le modufico el `value` y lo inserto
      entity.value = value;
      _box.put(entity);
    }
    return value;
  }

  KeyValueEntity? _read() {
    //busco el KeyValueEntity que tenga esa llave
    return _box
        .query(
          KeyValueEntity_.key.equals(key),
        )
        .build()
        .findUnique();
  }

  @override
  String? destroy() {
    //busco el entity ya existente
    final entity = _read();

    //si ya existe lo elimino, si no no hago nada
    if (entity != null) {
      _box.remove(entity.id);
    }
    return entity?.value;
  }

  @override
  void init() {}

  @override
  void dispose() {}
}
