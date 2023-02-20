import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueRepo extends DelegatedCRUDRepository<KeyValueDomain, KeyValueEntity,
    KeyValueObjectBox> {
  KeyValueRepo(KeyValueObjectBox repo)
      : super(
          externalRepo: repo,
          converter: KeyValueConverter.converter,
        );

  KeyValueEntity? read(String key) {
    return read(key);
  }
}
