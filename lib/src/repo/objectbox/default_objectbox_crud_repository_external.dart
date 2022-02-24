import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

/// EXAMPLE:
/// This is the implementation of DefaultObjectBoxCRUDRepositoryExternal.
/// See [ParentRepoExternal] for ParentRepoExternal's example code.
///
/// ```dart
///   class ParentRepoExternalImpl
///       extends DefaultObjectBoxCRUDRepositoryExternal<ParentEntity>
///         implements ParentRepoExternal {
///     ParentRepoExternalImpl(Store store) : super(store);
///   }
///
/// ```
class DefaultObjectBoxCRUDRepositoryExternal<Entity extends BasicEntityObject>
    extends CRUDRepositoryExternal<Entity> {
  final Box<Entity> _box;

  DefaultObjectBoxCRUDRepositoryExternal(Store _store)
      : _box = Box<Entity>(_store);

  Box<Entity> get box => _box;

  @override
  Entity create(Entity newEntity) {
    ///persist and get the new generated id
    newEntity.id = _box.put(newEntity);

    return newEntity;
  }

  @override
  Entity edit(Entity entity) {
    ///ignored return type, return type => id generated, in edit case, the id isn't generated
    _box.put(entity); //must have [id] property != null && > 0

    return entity;
  }

  Entity destroy(Entity objectToDestroy) {
    ///destroy action in the box
    _box.remove(objectToDestroy.id);

    return objectToDestroy;
  }

  Entity findBy(int keyId) => _box.get(keyId)!;

  List<Entity> findAll() => _box.getAll();

  @override
  int count() => _box.count();

  @override
  void init() {}

  @override
  void dispose() {}
}
