import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class DefaultDateTimeKeyValueUseCaseImpl
    extends SingleKeyValueUseCaseImpl<String, DateTime> {
  DefaultDateTimeKeyValueUseCaseImpl({
    required String key,
    DateTime? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: DateTimeDefaultConverter.converter,
        );
}
