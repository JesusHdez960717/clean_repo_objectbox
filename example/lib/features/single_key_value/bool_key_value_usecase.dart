import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

abstract class BoolKeyValueUseCase extends SingleKeyValueUseCase<String, bool> {
  bool changeValue();
}
