import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/app/key_value_app_exporter.dart';

class KeyValueUseCaseImpl extends DefaultCRUDUseCase<KeyValueDomain>
    implements KeyValueUseCase {
  late KeyValueRepo _repo;

  KeyValueUseCaseImpl(KeyValueRepo repo)
      : _repo = repo,
        super(repo: repo);
}
