import 'package:clean_core/clean_core.dart';

class ParentDomain extends BasicDomainObject {
  int id;
  String name;
  DateTime bornDay;

  ParentDomain({required this.name, required this.bornDay, this.id = 0});

  String get bornDayFormat => bornDay.toString();

  @override
  String toString() {
    return 'ParentDomain{name: $name}';
  }
}
