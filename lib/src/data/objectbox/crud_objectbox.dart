import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

///Default CRUD repository of type Entity extends [EntityObject]
///for ObjectBox direct operations.
///
/// EXAMPLE:
/// ```dart
///   class ParentObjectBox
///       extends CRUDObjectBox_Impl<ParentEntity> {
///     ParentObjectBox(Store store) : super(store);
///   }
/// ```
abstract class CRUDObjectBox<Entity extends EntityObject> {
  ///Create the entity.
  Entity create(Entity newObject);

  ///Edit the entity.
  Entity edit(Entity objectToEdit);

  ///Destroy the entity.
  void delete(Entity objectToDestroy);

  ///Destroy the entity by it's id.
  void deleteById(int id);

  ///Find the correspondent entity by it's Key Id.
  Entity? findById(int keyId);

  ///Find all entity.
  List<Entity> findAll();

  ///Count the amount of entity.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }

  void init();

  void dispose();
}
