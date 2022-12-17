import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ParentFrameworkRepoImpl
    extends DefaultObjectBoxCRUDFrameworkRepo<ParentEntity>
    implements ParentFrameworkRepo {
  ParentFrameworkRepoImpl(Store store) : super(store);
}
