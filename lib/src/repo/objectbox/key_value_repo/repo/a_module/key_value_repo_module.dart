import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class KeyValueRepoModule {
  static late final Store
      _STORE; //todo: posible null pointer, llamar primero al constructor

  static const _KeyValueDir = "/key_value_dir";

  static late KeyValueRepo keyValueRepo;

  static Future<bool> init({String directory = ""}) async {
    //obtiene el directorio por defecto
    Directory defaultDir = await defaultStoreDirectory();

    //se concatenan las direcciones
    Directory dbDir = Directory('${defaultDir.path}$directory$_KeyValueDir');

    //Se crea el directorio por si no está creado
    dbDir = await dbDir.create(recursive: true);

    _STORE = await openStore(directory: dbDir.path);

    KeyValueRepoExternal keyValueExternalRepo =
        KeyValueRepoExternalImpl(_STORE);
    keyValueRepo = KeyValueRepoImpl(keyValueExternalRepo);

    return _STORE != null;
  }

  static SingleKeyValueRepo<K, V> buildKeyValueRepo<K, V>({
    required SingleKeyValueConverter<K, V> converter,
    required K key,
  }) {
    return SingleKeyValueRepoImpl(
      converter: converter,
      key: key,
      singleRepoExternal: SingleKeyValueRepoExternalImpl(_STORE),
    );
  }

  static void dispose() {
    _STORE.close();
  }
}
