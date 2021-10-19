import 'dart:async';

import 'package:clean_core/clean_core.dart';

import '../objectbox_app_exporter.dart';

abstract class ParentRepo extends CRUDRepository<ParentDomain> {
  StreamController<List<ParentDomain>> streamController();
}
