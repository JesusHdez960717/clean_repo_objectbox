import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:objectbox/objectbox.dart';

class KeyValueRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<KeyValueEntity>
    implements KeyValueRepoExternal {
  KeyValueRepoExternalImpl(Store store) : super(store);

  KeyValueEntity? read(String key) {
    return box
        .query(
      KeyValueEntity_.key.equals(key),
    )
        .build()
        .findUnique();
  }
}
