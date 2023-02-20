import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

///Simplest of all entity's objects
///Entity has [IntIdentifier] and [Comparable]<[EntityObject]>
///
/// EXAMPLE:
/// ```dart
///   class ParentEntity extends EntityObject {
///
///       int id;
///       String name;
///       DateTime bornDay;
///
///       ParentEntity({required this.name, this.id = 0, DateTime? date})
///           : bornDay = date ?? DateTime.now();
///   }
/// ```
abstract class EntityObject with IntIdentifier, Comparable<EntityObject> {
  ///By default compare the two entities by it's id
  @override
  int compareTo(EntityObject other) {
    return this.id.compareTo(other.id);
  }
}
