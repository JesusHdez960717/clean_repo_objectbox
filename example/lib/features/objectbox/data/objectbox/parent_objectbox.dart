import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ParentObjectBox extends CRUDObjectBox_Impl<ParentEntity> {
  ParentObjectBox(Store store) : super(store);
}
