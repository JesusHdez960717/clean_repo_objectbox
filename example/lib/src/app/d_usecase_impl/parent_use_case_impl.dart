import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/src/app/objectbox_app_exporter.dart';

class ParentUseCaseImpl extends DefaultCRUDUseCase<ParentDomain, ParentRepo>
    implements ParentUseCase {
  ParentUseCaseImpl(ParentRepo repo) : super(repo: repo);

  StreamController<List<ParentDomain>> streamController() {
    return repo.streamController();
  }
}
