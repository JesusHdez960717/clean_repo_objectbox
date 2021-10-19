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
abstract class ObjectBoxCRUDRepositoryExternal<Entity extends BasicEntityObject>
    extends CRUDRepositoryExternal<Entity> {
  Box<Entity> get box;
}
