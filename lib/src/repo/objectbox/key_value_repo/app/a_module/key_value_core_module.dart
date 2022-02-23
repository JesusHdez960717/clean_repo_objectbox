import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/repo/key_value_repo_exporter.dart';

class KeyValueCoreModule {
  static Future init({String directory = ""}) async {
    await KeyValueRepoModule.init(directory: directory);
  }

  static void dispose() {
    KeyValueRepoModule.dispose();
  }
}
