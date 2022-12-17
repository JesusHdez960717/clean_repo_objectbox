import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

abstract class KeyValueRepo extends CRUDRepository<KeyValueDomain> {
  KeyValueEntity? read(String key);
}
