import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

import '../objectbox_app_exporter.dart';

class ObjectBoxExampleCoreModule {
  static late final ParentUseCase PARENT_USECASE;

  static Future<bool> init() async {
    print('Iniciando ObjectBoxExampleCoreModule');
    await ObjectBoxExampleRepoModule.init();
    print('iniciado repo module');
    PARENT_USECASE = ParentUseCaseImpl(ObjectBoxExampleRepoModule.PARENT_REPO);
    print('iniciado PARENT_USECASE');
    return true;
  }

  static void dispose() {
    ObjectBoxExampleRepoModule.dispose();
  }
}
