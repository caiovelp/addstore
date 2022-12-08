class User {
  int? id;
  late String name;
  late String email;
  late String password;

  User({required this.name, required this.email, required this.password});

  User.fromMap(Map map) {
    this.id = map["id"];
    this.name = map["name"];
    this.email = map["email"];
    this.password = map["password"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": this.name,
      "email": this.email,
      "password": this.password
    };

    map["id"] ??= this.id;

    return map;
  }
}