import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class DefaultBigIntKeyValueUseCaseImpl
    extends SingleKeyValueUseCaseImpl<String, BigInt> {
  DefaultBigIntKeyValueUseCaseImpl({
    required String key,
    BigInt? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: BigIntDefaultConverter.converter,
        );
}
