import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class KeyValueUseCaseImpl
    extends DefaultCRUDUseCase<KeyValueDomain, KeyValueRepo>
    implements KeyValueUseCase {
  KeyValueUseCaseImpl(KeyValueRepo repo) : super(repo: repo);

  KeyValueEntity? read(String key) {
    return read(key);
  }
}
