import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

@Entity() //flutter pub run build_runner build
class KeyValueEntity extends EntityObject {
  @Id()
  int id;

  @Unique(onConflict: ConflictStrategy.replace)
  String key;

  String value;

  KeyValueEntity(this.key, this.value,
      {this.id = 0}); //default construct, DON'T REMOVE

}
