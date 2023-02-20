import 'package:clean_repo_objectbox/clean_repo_objectbox.dart';

@Entity() // flutter pub run build_runner build
class ParentEntity extends EntityObject {
  @Id()
  int id;

  String name;

  @Property(type: PropertyType.date)
  DateTime bornDay;

  ParentEntity(this.name, this.bornDay,
      {this.id = 0}); //default construct, DON'T REMOVE

  //this is the one to use
  ParentEntity.build({required this.name, this.id = 0, DateTime? date})
      : bornDay = date ?? DateTime.now();
}
