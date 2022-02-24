import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class KeyValueCoreModule {
  static late KeyValueUseCase keyValueUC;

  static Future init({String directory = ""}) async {
    await KeyValueRepoModule.init(directory: directory);

    keyValueUC = KeyValueUseCaseImpl(KeyValueRepoModule.keyValueRepo);
  }

  static void dispose() {
    KeyValueRepoModule.dispose();
  }
}
