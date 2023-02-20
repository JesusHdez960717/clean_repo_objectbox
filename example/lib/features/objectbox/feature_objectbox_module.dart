import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class FeatureObjectBoxModule {
  static late final ParentController PARENT_CONTROLLER;

  static late final ParentUseCase _parentUC;

  static Future<bool> init() async {
    //repo
    await ObjectBoxExampleRepoModule.init();

    //uc
    _parentUC = ParentUseCase(ObjectBoxExampleRepoModule.PARENT_REPO);

    //ui
    PARENT_CONTROLLER = ParentControllerImpl(parentUC: _parentUC);

    return true;
  }

  static void dispose() {
    _parentUC.dispose();

    ObjectBoxExampleRepoModule.dispose();
  }
}
