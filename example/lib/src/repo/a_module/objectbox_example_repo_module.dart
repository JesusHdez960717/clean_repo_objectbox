import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ObjectBoxExampleRepoModule {
  static late final Store
      STORE; //todo: posible null pointer, llamar primero al constructor

  static late final ParentRepo PARENT_REPO;

  static Future<Store> init() async {
    STORE = await openStore();
    ParentRepoExternal external = ParentRepoExternalImpl(STORE);
    PARENT_REPO = ParentRepoImpl(external);
    return STORE;
  }

  static void dispose() {
    STORE.close();
  }
}
