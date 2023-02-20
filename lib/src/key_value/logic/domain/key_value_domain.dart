class KeyValueDomain {
  int id;
  String key;
  String value;

  KeyValueDomain({required this.key, required this.value, this.id = 0});

  @override
  String toString() {
    return 'KeyValueDomain{id: $id, key: $key, value: $value}';
  }
}
