import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueUseCaseImpl
    extends DelegatedCRUDUseCase<KeyValueDomain, KeyValueRepo>
    implements KeyValueUseCase {
  KeyValueUseCaseImpl(KeyValueRepo repo) : super(repo: repo);

  KeyValueEntity? read(String key) {
    return read(key);
  }
}
