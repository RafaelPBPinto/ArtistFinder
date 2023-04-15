import 'dart:ffi';

class Artist {
  String username;
  String email;
  String password;
  String data_nasc;
  String type;
  double avaliation;
  Artist(
      {required this.username,
      required this.email,
      required this.password,
      required this.data_nasc,
      required this.type,
      required this.avaliation});

  @override
  String toString() {
    return "username: $username , email: $email , type: $type , avaliation : $avaliation";
  }
}
