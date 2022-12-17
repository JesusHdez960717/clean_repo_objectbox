import 'dart:async';

import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

abstract class ParentController {
  void addParent(String name);

  StreamController<List<ParentDomain>> streamController();

  void delete(ParentDomain parent);
}
