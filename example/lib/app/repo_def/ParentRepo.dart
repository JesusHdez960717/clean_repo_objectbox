import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

import '../objectbox_app_exporter.dart';

abstract class ParentRepo extends CRUDRepository<ParentDomain> {
  ParentRepo(Store store);

  StreamController<List<ParentDomain>> streamController();
}
