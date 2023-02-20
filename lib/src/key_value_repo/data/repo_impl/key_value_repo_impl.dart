import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueRepoImpl extends DelegatedCRUDRepo<KeyValueDomain, KeyValueEntity,
    KeyValueFrameworkRepo> implements KeyValueRepo {
  KeyValueRepoImpl(KeyValueFrameworkRepo repo)
      : super(
          externalRepo: repo,
          converter: KeyValueConverter.converter,
        );

  KeyValueEntity? read(String key) {
    return read(key);
  }
}
