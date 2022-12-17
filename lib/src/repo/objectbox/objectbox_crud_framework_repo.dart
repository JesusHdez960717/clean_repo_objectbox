import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

/// EXAMPLE:
/// This is the implementation of ObjectBoxCRUDRepositoryExternal.
/// See [ParentEntity] for ParentEntity's example code.
/// ```dart
///   abstract class ParentRepoExternal
///     extends ObjectBoxCRUDRepositoryExternal<ParentEntity> {
///   }
///```
abstract class ObjectBoxCRUDFrameworkRepo<Entity extends BasicEntityObject>
    extends CRUDRepositoryFramework<Entity> {
  Box<Entity> get box;
}
