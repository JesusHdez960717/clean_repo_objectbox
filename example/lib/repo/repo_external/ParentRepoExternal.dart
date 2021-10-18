import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';
import 'package:objectbox/objectbox.dart';

abstract class ParentRepoExternal extends CRUDRepositoryExternal<ParentEntity> {
  Box<ParentEntity> get box;
}
