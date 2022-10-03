import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

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
