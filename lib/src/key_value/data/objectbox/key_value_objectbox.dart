import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';
import 'package:objectbox/objectbox.dart';

class KeyValueObjectBox
    extends CRUDObjectBox_Impl<KeyValueEntity> {
  KeyValueObjectBox(Store store) : super(store);

  KeyValueEntity? read(String key) {
    return box
        .query(
      KeyValueEntity_.key.equals(key),
    )
        .build()
        .findUnique();
  }
}
