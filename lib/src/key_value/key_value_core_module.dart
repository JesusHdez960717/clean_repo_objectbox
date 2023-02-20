import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueCoreModule {
  static late KeyValueUseCase keyValueUC;

  static Future init({String directory = ""}) async {
    await KeyValueDataModule.init(directory: directory);

    keyValueUC = KeyValueUseCaseImpl(
      repo: KeyValueDataModule.keyValueRepo,
    );
  }

  static void dispose() {
    KeyValueDataModule.dispose();
    keyValueUC.dispose();
  }
}
