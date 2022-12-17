import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DefaultIntKeyValueUseCaseImpl
    extends SingleKeyValueUseCaseImpl<String, int> {
  DefaultIntKeyValueUseCaseImpl({
    required String key,
    int? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: IntDefaultConverter.converter,
        );
}
