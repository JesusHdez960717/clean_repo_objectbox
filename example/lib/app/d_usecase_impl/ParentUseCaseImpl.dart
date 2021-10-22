import 'dart:async';
import 'package:clean_core/clean_core.dart';

import '../objectbox_app_exporter.dart';

class ParentUseCaseImpl extends DefaultCRUDUseCase<ParentDomain>
    implements ParentUseCase {
  late ParentRepo _repo;

  ParentUseCaseImpl(ParentRepo repo)
      : _repo = repo,
        super(repo: repo);

  StreamController<List<ParentDomain>> streamController() {
    return _repo.streamController();
  }
}
