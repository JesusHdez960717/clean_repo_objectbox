import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

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
