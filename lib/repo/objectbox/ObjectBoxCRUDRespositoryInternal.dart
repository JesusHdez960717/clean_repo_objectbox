import 'package:clean_core/flutter/app/PropertyChangeConstrains.dart';
import 'package:clean_core/flutter/app/repo/CRUDRespositoryInternal.dart';
import 'package:clean_core/flutter/app/repo/entity/CleanCoreEntityExporter.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxCRUDRespositoryInternal<Entity extends BasicEntityObject>
    extends CRUDRespositoryInternal<Entity> {
  final Box<Entity> _box;

  ObjectBoxCRUDRespositoryInternal(Store _store) : _box = Box<Entity>(_store);

  Box<Entity> get box => _box;

  @override
  Entity create(Entity newEntity) {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newEntity");

    ///persist and get the new generated id
    newEntity.id = _box.put(newEntity);

    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newEntity");
    return newEntity;
  }

  @override
  Entity edit(Entity entity) {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $entity");

    ///ignored return type, return type => id generated, in edit case, the id isn't generated
    _box.put(entity); //must have [id] property != null && > 0

    print("${PropertyChangeConstrains.AFTER_EDIT}  => $entity");
    return entity;
  }

  Entity destroy(Entity objectToDestroy) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");

    ///destroy action in the box
    bool deleted = _box.remove(objectToDestroy.id);

    print(
        "${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy. Deleted: $deleted");

    return objectToDestroy;
  }

  Entity findBy(int keyId) {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => keyID: $keyId");

    ///check if entity with [ketId] exists
    if (!_box.contains(keyId)) {
      throw UnsupportedError("No se maneja todavia que no exita el objeto");
    }

    ///findBy action in the box
    Entity entity = _box.get(keyId)!;

    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $entity");
    return entity;
  }

  List<Entity> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");

    ///findAll action in the box
    List<Entity> all = _box.getAll();

    print("${PropertyChangeConstrains.AFTER_EDIT}  => $all");
    return all;
  }

  @override
  int count() {
    print("${PropertyChangeConstrains.BEFORE_COUNT}");

    ///count action in the box
    int count = _box.count();

    print("${PropertyChangeConstrains.AFTER_COUNT}  => $count");
    return count;
  }
}
