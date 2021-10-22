import 'package:clean_core/clean_core.dart';

import '../objectbox_app_exporter.dart';

class ChildUseCaseImpl extends DefaultCRUDUseCase<ChildDomain>
    implements ChildUseCase {
  ChildUseCaseImpl(ChildRepo repo) : super(repo: repo);
}
