import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';
import 'package:objectbox/objectbox.dart';

import '../../objectbox.g.dart';

class ObjectBoxExampleRepoModule {
  static late final Store
      STORE; //todo: posible null pointer, llamar primero al constructor

  static late final ParentRepo PARENT_REPO;

  //static late final ChildRepo CHILD_REPO;

  static Future<Store> init() async {
    Store store = await openStore().then((value) {
      STORE = value;
      PARENT_REPO = ParentRepoImpl(ParentRepoExternalImpl(STORE));
      //CHILD_REPO = ChildRepoImpl();
      return value;
    });
    return store;
  }

  static void dispose() {
    STORE.close();
  }
}
