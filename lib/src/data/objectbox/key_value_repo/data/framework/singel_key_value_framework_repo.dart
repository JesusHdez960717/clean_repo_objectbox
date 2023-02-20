import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';
import 'package:objectbox/objectbox.dart';

abstract class SingleKeyValueFrameworkRepo implements AbstractFrameworkRepo {
  Box<KeyValueEntity> get box;

  String? read(String key);

  String update(String key, String value);

  void destroy(String key);
}
