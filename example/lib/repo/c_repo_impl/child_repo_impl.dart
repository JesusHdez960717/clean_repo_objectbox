import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/app/objectbox_app_exporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

class ChildRepoImpl extends DefaultCRUDRepo<ChildDomain, ChildEntity>
    implements ChildRepo {
  ChildRepoImpl()
      : super(
            externalRepo: ChildRepoExternalImpl(),
            converter: ChildEntity.CONVERTER);
}
