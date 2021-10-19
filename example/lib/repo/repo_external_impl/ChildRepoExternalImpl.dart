import 'package:clean_repo_objectbox/CleanObjectBoxExporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

class ChildRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<ChildEntity>
    implements ChildRepoExternal {
  ChildRepoExternalImpl() : super(ObjectBoxExampleRepoModule.STORE);
}
