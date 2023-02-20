import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class BigIntKeyValueUseCase
    extends SingleKeyValueUseCaseImpl<String, BigInt> {
  BigIntKeyValueUseCase({
    required String key,
    BigInt? defaultValue,
  }) : super(
          key: key,
          defaultValue: defaultValue,
          converter: BigIntDefaultConverter.converter,
        );
}
