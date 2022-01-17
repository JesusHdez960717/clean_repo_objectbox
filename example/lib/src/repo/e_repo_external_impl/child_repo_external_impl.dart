import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ChildRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<ChildEntity>
    implements ChildRepoExternal {
  ChildRepoExternalImpl() : super(ObjectBoxExampleRepoModule.STORE);
}
