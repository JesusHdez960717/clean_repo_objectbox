import 'package:clean_repo_objectbox/repo/objectbox/ObjectBoxCRUDRespositoryInternal.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

class ChildRepoExternalImpl
    extends ObjectBoxCRUDRespositoryInternal<ChildEntity>
    implements ChildRepoExternal {
  ChildRepoExternalImpl() : super(ObjectBoxExampleRepoModule.STORE);
}
