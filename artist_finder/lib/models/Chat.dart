class Chat {
  final id_artist, id_contratante;
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.id_artist = 0,
    this.id_contratante = 0,
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    id_artist: 8,
    id_contratante: 3,
    name: "Pedro Piaf",
    lastMessage: "Contraprosta: 150€",
    image: "",
    time: "3m atrás",
    isActive: true,
  ),
  Chat(
    id_artist: 16,
    id_contratante: 3,
    name: "Luísa",
    lastMessage: "Proprosta: 50€",
    image: "",
    time: "8m atrás",
    isActive: false,
  ),
  Chat(
    id_artist: 14,
    id_contratante: 3,
    name: "Filhipe Vilhena",
    lastMessage: "Contraprosta: 100€",
    image: "",
    time: "5d atrás",
    isActive: true,
  ),
];
