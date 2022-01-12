import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';
import 'package:objectbox/objectbox.dart';

class ParentRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<ParentEntity>
    implements ParentRepoExternal {
  ParentRepoExternalImpl(Store store) : super(store);
}
