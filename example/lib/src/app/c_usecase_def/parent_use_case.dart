import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/src/app/objectbox_app_exporter.dart';

abstract class ParentUseCase extends CRUDUseCase<ParentDomain> {
  StreamController<List<ParentDomain>> streamController();
}
