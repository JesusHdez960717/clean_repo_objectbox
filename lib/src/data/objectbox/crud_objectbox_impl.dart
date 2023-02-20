import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

/// EXAMPLE:
/// This is the implementation of DefaultObjectBoxCRUDRepositoryExternal.
///
/// ```dart
///   class ParentObjectBox
///       extends CRUDObjectBox_Impl<ParentEntity> {
///     ParentObjectBox(Store store) : super(store);
///   }
///
/// ```
class CRUDObjectBox_Impl<Entity extends EntityObject> extends CRUDObjectBox<Entity>{
  final Box<Entity> _box;

  CRUDObjectBox_Impl(Store _store)
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

  @override
  void delete(Entity objectToDestroy) {
    ///destroy action in the box
    _box.remove(objectToDestroy.id);
  }

  @override
  void deleteById(int id) {
    ///destroy action in the box
    _box.remove(id);
  }

  Entity? findById(int keyId) => _box.get(keyId)!;

  List<Entity> findAll() => _box.getAll();

  @override
  int count() => _box.count();

  @override
  void init() {}

  @override
  void dispose() {}
}
