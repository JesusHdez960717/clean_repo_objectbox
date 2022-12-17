import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

abstract class IntKeyValueUseCase extends SingleKeyValueUseCase<String, int> {
  int changeValue();
}
