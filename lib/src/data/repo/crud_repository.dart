///Repository of CRUD operations, of type Domain.
///Generally not implemented, instead extends the repo from [DelegatedCRUDRepository].
///
/// EXAMPLE:
/// This is the definition of Parent CRUDRepository, it need to be
/// implemented after, implementation example at [DefaultCRUDRepo].
///
/// See [Domain] for ParentDomain's example code.
///
/// ```dart
///   abstract class ParentRepo extends CRUDRepository<ParentDomain> {
///     //define in here the methods of this repo, implemented it [DefaultCRUDRepo]
///     void doStuffInRepo();
///   }
/// ```
abstract class CRUDRepository<Domain> {
  ///Create the domain.
  Domain create(Domain newObject);

  ///Edit the domain.
  Domain edit(Domain objectToEdit);

  ///Destroy the domain.
  void delete(Domain objectToDestroy);

  ///Destroy the domain by it's id.
  void deleteById(int id);

  ///Find the correspondent domain by it's Key Id.
  Domain? findById(int keyId);

  ///Find all domains.
  List<Domain> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }

  void init();

  void dispose();
}
