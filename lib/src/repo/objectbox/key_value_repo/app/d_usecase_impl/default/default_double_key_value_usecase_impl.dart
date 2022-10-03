import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class DefaultDoubleKeyValueUseCaseImpl extends SingleKeyValueUseCaseImpl<String, double> {

  DefaultDoubleKeyValueUseCaseImpl({
    required String key,
    double? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: DoubleDefaultConverter.converter,
        );

}
