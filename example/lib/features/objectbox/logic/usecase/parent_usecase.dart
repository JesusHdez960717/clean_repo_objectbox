import 'dart:async';

import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ParentUseCase {
  final ParentRepo repo;

  ParentUseCase(this.repo);

  StreamController<List<ParentDomain>> streamController() {
    return repo.streamController();
  }

  @override
  void dispose() {
    repo.dispose();
  }
}
