import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class IntKeyValueUseCase
    extends SingleKeyValueUseCaseImpl<String, int> {
  IntKeyValueUseCase({
    required String key,
    int? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: IntDefaultConverter.converter,
        );
}
