import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DoubleKeyValueUseCase extends SingleKeyValueUseCaseImpl<String, double> {

  DoubleKeyValueUseCase({
    required String key,
    double? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: DoubleDefaultConverter.converter,
        );

}
