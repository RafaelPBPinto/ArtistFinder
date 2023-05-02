class Proposal {
  int contr_id;
  String date;
  String hours;
  double price;
  String details;
  Proposal({
    required this.contr_id,
    required this.date,
    required this.hours,
    required this.price,
    required this.details,
  });

  @override
  String toString() {
    return "id: $contr_id , hours: $hours , date: $date , price: $price ";
  }
}
