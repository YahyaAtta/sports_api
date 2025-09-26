class Player {
  final int? id;
  final String name;
  final int age;
  final String photo;
  Player({this.id, required this.name, required this.age, required this.photo});
}

Player? fromJson(Map json) => switch (json) {
      {
        'id': int id,
        'name': String name,
        'age': int age,
        'photo': String photo
      } =>
        Player(id: id, name: name, age: age, photo: photo),
      _ => null
    };
