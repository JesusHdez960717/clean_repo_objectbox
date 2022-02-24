import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

import '../../../objectbox.g.dart';

class ObjectBoxExampleRepoModule {
  static late final Store
      STORE; //todo: posible null pointer, llamar primero al constructor

  static late final ParentRepo PARENT_REPO;

  static Future<Store> init() async {
    print('iniciando ObjectBoxExampleRepoModule');
    STORE = await openStore();
    print('iniciado STORE');
    ParentRepoExternal external = ParentRepoExternalImpl(STORE);
    print('iniciado external');
    PARENT_REPO = ParentRepoImpl(external);
    print('iniciado PARENT_REPO');
    return STORE;
  }

  static void dispose() {
    STORE.close();
  }
}
