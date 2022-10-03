import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

abstract class KeyValueRepoExternal
    extends ObjectBoxCRUDRepositoryExternal<KeyValueEntity> {
  KeyValueEntity? read(String key);
}
