import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

import '../objectbox_app_exporter.dart';

class ObjectBoxCoreModule {
  static late final ParentUseCase PARENT_USECASE;

  //static late final ChildUseCase CHILD_USECASE;

  static Future<bool> init() async {
    await ObjectBoxExampleRepoModule.init();
    PARENT_USECASE = ParentUseCaseImpl(ObjectBoxExampleRepoModule.PARENT_REPO);
    return true;
  }

  static void dispose() {
    ObjectBoxExampleRepoModule.dispose();
  }
}
