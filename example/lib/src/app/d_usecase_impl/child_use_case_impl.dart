import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/src/app/objectbox_app_exporter.dart';

class ChildUseCaseImpl extends DefaultCRUDUseCase<ChildDomain>
    implements ChildUseCase {
  ChildUseCaseImpl(ChildRepo repo) : super(repo: repo);
}
