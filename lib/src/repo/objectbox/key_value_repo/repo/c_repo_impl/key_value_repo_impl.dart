import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox/src/repo/objectbox/key_value_repo/key_value_exporter.dart';

class KeyValueRepoImpl extends DefaultCRUDRepo<KeyValueDomain, KeyValueEntity>
    implements KeyValueRepo {
  late KeyValueRepoExternal _external; //TODO: remove

  KeyValueRepoImpl(
      KeyValueRepoExternal repo, KeyValueSingleConverter kvConverter)
      : super(externalRepo: repo, converter: KeyValueConverter(kvConverter)) {
    _external = repo;
  }
}

class KeyValueConverter
    extends DefaultGeneralConverter<KeyValueDomain, KeyValueEntity> {
  KeyValueSingleConverter kvConverter;

  KeyValueConverter(this.kvConverter);

  @override
  KeyValueDomain toDomain(KeyValueEntity entity) {
    return KeyValueDomain(
      id: entity.id,
      key: kvConverter.stringToKey(entity.key),
      value: kvConverter.stringToValue(entity.value),
    );
  }

  @override
  KeyValueEntity toEntity(KeyValueDomain domain) {
    return KeyValueEntity(
      kvConverter.keyToString(domain.key),
      kvConverter.valueToString(domain.value),
      id: domain.id,
    );
  }
}
