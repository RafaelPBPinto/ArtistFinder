class Artist {
  int id;
  String username;
  String email;
  String password;
  String data_nasc;
  String type;
  double avaliation;
  String description = "Sem descricao adicionada pelo artista";
  String? subtype;
  String locality;
  dynamic image_url;
  int no_avaliations;
  Artist(
      {this.id = 0,
      required this.username,
      required this.email,
      required this.password,
      required this.data_nasc,
      required this.type,
      required this.subtype,
      required this.avaliation,
      required this.locality,
      required this.description,
      required this.image_url,
      required this.no_avaliations});

  @override
  String toString() {
    return "id: $id , username: $username , email: $email , type: $type , avaliation : $avaliation , image_url : $image_url";
  }
}
