import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/key_value_exporter.dart';

class SingleKeyValueRepoImpl<K, V> extends SingleKeyValueRepo<K, V> {
  final K key;
  final SingleKeyValueConverter<K, V> converter;
  final SingleKeyValueRepoExternal singleRepoExternal;
  final String _externalKey;

  SingleKeyValueRepoImpl({
    required this.converter,
    required this.key,
    required this.singleRepoExternal,
  }) : _externalKey = converter.keyToString(key);

  V? read() {
    //leo el valor
    final rawValue = singleRepoExternal.read(_externalKey);

    //si el valor NO es null, lo convierto y devuelvo, si no devulvo el null
    return rawValue != null ? converter.stringToValue(rawValue) : null;
  }

  V update(V value) {
    //reviso si el valor que me pasan es null
    if (value != null) {
      //si NO es null lo convierto
      String externalValue = converter.valueToString(value);
      //actualizo con el valor convertido NO null
      //ignoto el return xq el valor no se modifica en el proceso
      singleRepoExternal.update(_externalKey, externalValue);
    }
    //devuelvo el mismo value, que no se odifica en ninguna parte del prceso
    return value;
  }

  V? destroy() {
    String? rawValue = singleRepoExternal.destroy(_externalKey);

    //si el valor NO es null, lo convierto y devuelvo, si no devulvo el null
    return rawValue != null ? converter.stringToValue(rawValue) : null;
  }
}
