import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueUseCaseImpl implements KeyValueUseCase {
  KeyValueRepo repo;

  KeyValueUseCaseImpl({required this.repo});

  KeyValueDomain? read(String key) {
    return read(key);
  }

  @override
  KeyValueDomain create(KeyValueDomain newObject) => repo.create(newObject);

  @override
  KeyValueDomain edit(KeyValueDomain objectToEdit) => repo.edit(objectToEdit);

  @override
  List<KeyValueDomain> findAll() => repo.findAll();

  @override
  KeyValueDomain? findById(int keyId) => repo.findById(keyId);

  @override
  void delete(KeyValueDomain objectToDestroy) => repo.delete(objectToDestroy);

  @override
  void deleteById(int id) => repo.deleteById(id);

  @override
  int count() => repo.count();

  @override
  void init() {}

  @override
  void dispose() {}
}
