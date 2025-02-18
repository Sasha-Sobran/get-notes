class User {
  final String name;
  final String surname;
  final String login;
  final String email;

  User({
    required this.name,
    required this.surname,
    required this.login,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      login: json['login'],
      email: json['email'],
    );
  }
}
