import 'package:clean_core/flutter/domain/IntIdentifier.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxGeneralRepoImpl<Entity extends IntIdentifier> {
  final Box<Entity> _box;

  ObjectBoxGeneralRepoImpl(Store _store) : _box = Box<Entity>(_store);

  Box<Entity> get box => _box;

  int create(Entity entity) {
    print("before_create $entity");
    int newID = _box.put(entity);
    print("after_create $newID");
    return newID;
  }

  bool destroy(Entity entity) {
    print("before_destroy $entity");
    bool deleted = _box.remove(entity.id);
    print("after_destroy deleted: $deleted id: $entity");
    return deleted;
  }

  bool destroyById(int id) {
    print("before_destroyById $id");
    bool deleted = _box.remove(id);
    print("after_find_all deleted: $deleted id: $id");
    return deleted;
  }

  int update(Entity entity) {
    print("before_create $entity");
    int newID = _box.put(entity); //must have [id] property != null && > 0
    print("after_create $entity");
    return newID;
  }

  List<Entity> findAll() {
    print("before_find_all");
    List<Entity> all = _box.getAll();
    print("after_find_all $all");
    return all;
  }

  int count() {
    print("before_count");
    int count = _box.count();
    print("before_count $count");
    return count;
  }
}
