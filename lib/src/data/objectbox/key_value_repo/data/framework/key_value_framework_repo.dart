import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

abstract class KeyValueFrameworkRepo
    extends ObjectBoxCRUDFrameworkRepo<KeyValueEntity> {
  KeyValueEntity? read(String key);
}
