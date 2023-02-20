import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';
import 'package:objectbox/objectbox.dart';

class KeyValueFrameworkRepoImpl
    extends DefaultObjectBoxCRUDFrameworkRepo<KeyValueEntity>
    implements KeyValueFrameworkRepo {
  KeyValueFrameworkRepoImpl(Store store) : super(store);

  KeyValueEntity? read(String key) {
    return box
        .query(
      KeyValueEntity_.key.equals(key),
    )
        .build()
        .findUnique();
  }
}
