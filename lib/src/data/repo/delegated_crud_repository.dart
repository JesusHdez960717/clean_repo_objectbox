import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

///Default implementation of [CRUDRepository] of type Domain & Entity extends [EntityObject]
///It's basically a delegate to the ObjectBox.
///
/// EXAMPLE:
/// This is the implementation of ParentRepo.
/// ```dart
///   class ParentRepo extends DelegatedCRUDRepository<ParentDomain, ParentEntity> {
///       @override
///       void doStuffInRepo(){
///         print('Doing Stuff in the repository layer...');
///       }
///   }
/// ```
abstract class DelegatedCRUDRepository<
        Domain,
        Entity extends EntityObject,
        ExternalRepo extends CRUDObjectBox<Entity>>
    extends CRUDRepository<Domain> {
  ///External repo, the one who really do the operations.
  ExternalRepo externalRepo;

  ///Converter of this repo, hadler of transaction domain <==> entity
  Converter<Domain, Entity> converter;

  ///Default Constructor
  DelegatedCRUDRepository({required this.externalRepo, required this.converter});

  ///Create the domain
  ///Return the domain after been persisted, the returned domain have the
  ///properties assigned by the repo, like the new id.
  @override
  Domain create(Domain newObject) {
    ///convert domain to entity to be compatible with External repo
    Entity entityToCreate = converter.toEntity(newObject);

    ///do the persist
    Entity entityCreated = externalRepo.create(entityToCreate); //do persist

    ///convert back the entity persisted to the domain
    newObject = converter.toDomain(entityCreated);

    return newObject;
  }

  ///Edit the domain
  @override
  Domain edit(Domain objectToEdit) {
    ///convert domain to entity to be compatible with External repo
    Entity entityToEdit = converter.toEntity(objectToEdit);

    ///do the update
    Entity entityEdited = externalRepo.edit(entityToEdit); //do edit

    ///convert back the entity edited to the domain
    objectToEdit = converter.toDomain(entityEdited);

    return objectToEdit;
  }

  ///Find all domains
  @override
  List<Domain> findAll() {
    ///find all entities
    List<Entity> entityList = externalRepo.findAll();

    ///convert all entities to domains
    List<Domain> domainList = converter.toDomainAll(entityList);

    return domainList;
  }

  ///Find the correspondent domain by it's Key Id.
  @override
  Domain? findById(int keyId) {
    ///find the entity
    Entity? entityFounded = externalRepo.findById(keyId);

    ///convert entity to domain if isn't null
    return entityFounded == null ? null : converter.toDomain(entityFounded);
  }

  ///Destroy the domain.
  @override
  void delete(Domain objectToDestroy) {
    ///convert the objectToDestroy into entity
    Entity entityToDestroy = converter.toEntity(objectToDestroy);

    ///destroy the entity
    externalRepo.delete(entityToDestroy);
  }

  ///Destroy the domain.
  @override
  void deleteById(int id) {
    ///destroy the entity
    externalRepo.deleteById(id);
  }

  ///Count the amount of domains.
  @override
  int count() => externalRepo.count();

  @override
  void init() {}

  @override
  void dispose() {}
}
