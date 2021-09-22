/*import 'package:clean_core/flutter/domain/IntIdentifier.dart';
import 'package:objectbox/objectbox.dart';

import 'ObjectBoxGeneralRepoImpl.dart';

class ObjectBoxGeneralRepoImplAsync<Entity extends IntIdentifier> {
  final ObjectBoxGeneralRepoImpl<Entity> _repo;
  late final Stream<Query<Entity>> queryStream;

  ObjectBoxGeneralRepoImplAsync(Store _store)
      : _repo = ObjectBoxGeneralRepoImpl(_store) {
    final qBuilder = _repo.box.query();
    queryStream = qBuilder.watch(triggerImmediately: true);
  }

  Future<int> create(Entity entity) async {
    print("async before_create $entity");
    int newID = _repo.create(entity);
    print("async after_create $newID");
    return newID;
  }

  Future<int> update(Entity entity) async {
    print("async before_create $entity");
    int newID = _repo.create(entity); //must have [id] property != null && > 0
    print("async after_create $entity");
    return newID;
  }

  Future<bool> destroy(Entity entity) async {
    print("async before_destroy $entity");
    bool deleted = _repo.destroy(entity);
    print("async after_destroy deleted: $deleted id: $entity");
    return deleted;
  }

  Future<bool> destroyById(int id) async {
    print("async before_destroyById $id");
    bool deleted = _repo.destroyById(id);
    print("async after_destroyById deleted: $deleted id: $id");
    return deleted;
  }

  Future<List<Entity>> findAll() async {
    print("async before_find_all");
    List<Entity> all = _repo.findAll();
    print("async  after_find_all $all");
    return all;
  }

  Future<int> count() async {
    print("async before_count");
    int count = _repo.count();
    print("async before_count $count");
    return count;
  }
}
*/
