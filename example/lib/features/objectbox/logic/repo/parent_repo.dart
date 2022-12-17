import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

abstract class ParentRepo extends CRUDRepository<ParentDomain> {
  StreamController<List<ParentDomain>> streamController();
}
