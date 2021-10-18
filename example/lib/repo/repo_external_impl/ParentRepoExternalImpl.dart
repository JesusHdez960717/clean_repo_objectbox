import 'package:clean_repo_objectbox/repo/objectbox/ObjectBoxCRUDRespositoryInternal.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';
import 'package:objectbox/objectbox.dart';

class ParentRepoExternalImpl
    extends ObjectBoxCRUDRespositoryInternal<ParentEntity>
    implements ParentRepoExternal {
  ParentRepoExternalImpl(Store store) : super(store);
}
