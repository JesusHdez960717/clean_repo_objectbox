import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

class KeyValueConverter
    extends GeneralConverter<KeyValueDomain, KeyValueEntity> {
  static final KeyValueConverter converter = KeyValueConverter._();

  KeyValueConverter._();

  @override
  KeyValueDomain toDomain(KeyValueEntity entity) {
    return KeyValueDomain(
      id: entity.id,
      key: entity.key,
      value: entity.value,
    );
  }

  @override
  KeyValueEntity toEntity(KeyValueDomain domain) {
    return KeyValueEntity(
      domain.key,
      domain.value,
      id: domain.id,
    );
  }
}
