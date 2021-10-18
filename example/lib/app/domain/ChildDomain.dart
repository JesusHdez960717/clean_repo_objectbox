import 'package:clean_core/clean_core.dart';

import 'ParentDomain.dart';

class ChildDomain extends BasicDomainObject {
  int id;

  String name;

  ParentDomain parentFK;

  ChildDomain({required this.name, required this.parentFK, this.id = 0});

  @override
  String toString() {
    return 'ChildDomain{name: $name}';
  }
}
