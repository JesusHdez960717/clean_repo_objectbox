import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

abstract class KeyValueUseCase {
  KeyValueDomain? read(String key);

  ///Create the domain.
  KeyValueDomain create(KeyValueDomain newObject);

  ///Edit the domain.
  KeyValueDomain edit(KeyValueDomain objectToEdit);

  ///Destroy the domain.
  void delete(KeyValueDomain objectToDestroy);

  ///Destroy the domain.
  void deleteById(int id);

  ///Find the correspondent domain by it's Key Id.
  KeyValueDomain? findById(int keyId);

  ///Find all domains.
  List<KeyValueDomain> findAll();

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }

  void init();

  void dispose();
}
