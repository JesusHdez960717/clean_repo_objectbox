import 'package:objectbox/objectbox.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class SingleKeyValueObjectBox{
  final Box<KeyValueEntity> _box;

  SingleKeyValueObjectBox(Store _store)
      : _box = Box<KeyValueEntity>(_store);

  Box<KeyValueEntity> get box => _box;

  String? read(String key) {
    KeyValueEntity? readed = _read(key);
    return readed == null ? null : readed!.value;
  }

  KeyValueEntity? _read(String key) {
    //busco el KeyValueEntity que tenga esa llave
    return _box
        .query(
      KeyValueEntity_.key.equals(key),
    )
        .build()
        .findUnique();
  }

  String update(String key, String value) {
    //busco el entity ya existente
    final entity = _read(key);

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

  void destroy(String key) {
    //busco el entity ya existente
    final entity = _read(key);

    //si ya existe lo elimino, si no no hago nada
    if (entity != null) {
      _box.remove(entity.id);
    }
  }

  @override
  void init() {}

  @override
  void dispose() {}
}
