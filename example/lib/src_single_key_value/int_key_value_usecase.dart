import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

abstract class IntKeyValueUseCase extends SingleKeyValueUseCase<String, int> {
  int changeValue();
}
