import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/key_value_exporter.dart';
import 'package:objectbox/objectbox.dart';

class KeyValueRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<KeyValueEntity>
    implements KeyValueRepoExternal {
  KeyValueRepoExternalImpl(Store store) : super(store);
}
