///General converter entity <==> domain, it generalize and extract the
///conversion entity => domain & domain => entity in a single isolated class
///
///Default implementation of [Converter]
///
/// EXAMPLE:
///
/// ```dart
/// class ParentConverter
///     extends Converter<ParentDomain, ParentEntity> {
///   @override
///   ParentDomain toDomain(ParentEntity entity) {
///     return ParentDomain(
///         name: entity.name, bornDay: entity.bornDay, id: entity.id);
///   }
///
///   @override
///   ParentEntity toEntity(ParentDomain domain) {
///     return ParentEntity(domain.name, domain.bornDay, id: domain.id);
///   }
/// }
/// ```
///
abstract class Converter<Domain, Entity> {
  ///Convert entity into domain.
  Domain toDomain(Entity entity);

  ///Convert domain into entity.
  Entity toEntity(Domain domain);

  ///Convert a list of entities into a list of domain.
  ///By default converting one by one into a new list
  ///using the single toDomain(entity) converter.
  List<Domain> toDomainAll(List<Entity> entities) =>
      entities.map((entity) => this.toDomain(entity)).toList();

  ///Convert a list of domain into a list of entities.
  ///By default converting one by one into a new list
  ///using the single toEntity(domain) converter.
  List<Entity> toEntityAll(List<Domain> domains) =>
      domains.map((domain) => this.toEntity(domain)).toList();
}
