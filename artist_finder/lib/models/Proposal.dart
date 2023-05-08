class Proposal {
  int proposalid;
  int contrid;
  int artistid;
  String date;
  String hours;
  double price;
  String details;
  bool isAccepted;
  Proposal(
      {required this.proposalid,
      required this.contrid,
      required this.artistid,
      required this.date,
      required this.hours,
      required this.price,
      required this.details,
      required this.isAccepted});

  @override
  String toString() {
    return "id: $contrid , hours: $hours , date: $date , price: $price ";
    //String contrante_name = ContratantById(contr_id);
    //String artist_name = ArtistById(artist_id);
    //return "Contrante: $contrante_name \n Artista: $artist_name \n Data: $date \n Hora: $hours \n Preço: $price \n Detalhes: $details";
  }
}
