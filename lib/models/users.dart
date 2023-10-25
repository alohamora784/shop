class Users {
  final int id;
  final String username;
  final String password;
  final String email;
  final String firstname;
  final String lastname;
  final String phone;
  final String image;
  

  factory Users.fromJson(json) {
    return Users(
      id: json["id"],
      username: json["username"],
      password: json["password"],
      email: json["email"],
      firstname: json["firstName"],
      lastname: json["lastName"],
      phone: json["phone"].toString(),
      image: json["image"],
    );
  }

  Users({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.image,
  });
}
