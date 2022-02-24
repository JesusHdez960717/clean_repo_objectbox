import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/key_value_exporter.dart';
import 'package:objectbox/objectbox.dart';

abstract class SingleKeyValueRepoExternal implements AbstractExternalRepo {
  Box<KeyValueEntity> get box;

  String? read(String key);

  String update(String key, String value);

  String? destroy(String key);
}
