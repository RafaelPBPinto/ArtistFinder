class User {
  String username;
  String email;
  String password;
  String data_nasc;

  User(
      {required this.username,
      required this.email,
      required this.password,
      required this.data_nasc});

  @override
  String toString() {
    return "username: $username , email: $email , password: $password";
  }
}
