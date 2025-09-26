class League {
  final int id;
  final String name;
  final String type;
  final String logo;
  League(
      {required this.id,
      required this.name,
      required this.type,
      required this.logo});
}

League? fromJsonLeagues(Map json) => switch (json) {
      {
        'id': int id,
        'name': String name,
        'type': String type,
        'logo': String logo
      } =>
        League(id: id, name: name, type: type, logo: logo),
      _ => null
    };
