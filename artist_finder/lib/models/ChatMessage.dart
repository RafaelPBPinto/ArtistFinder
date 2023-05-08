enum ChatMessageType { text, offer }

enum MessageStatus { not_sent, not_view, viewed }

enum OfferStatus { pending, accepted, rejected }

class ChatMessage {
  final int id = idcounter++;
  final int id_contratante;
  final int id_artista;
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final OfferStatus offerStatus;
  final bool isSender;

  static int idcounter = 0;

  ChatMessage({
    this.id_contratante = 0,
    this.id_artista = 0,
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    this.offerStatus = OfferStatus.pending,
  });
}

List demoChatMessages = [
  // CHAT WITH ARTIST MESSAGES //
  ChatMessage(
    id_artista: 8,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Ofereceste a Pedro Piaf:\n100€\nDia: 08/05/2023\nHora: 20:30h\nDuracao: 2h",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.rejected,
    isSender: true,
  ),
  ChatMessage(
    id_artista: 8,
    id_contratante: 999999, // irrelevante aqui
    text: "Não me dá jeito às 20h30",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    id_artista: 8,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Pedro Piaf propõe:\n300€\nDia: 08/05/2023\nHora: 21:00h\nDuracao: 1h30",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.rejected,
    isSender: false,
  ),
  ChatMessage(
    id_artista: 16,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Ofereceste a Luísa:\n50€\nDia: 12/05/2023\nHora: 20:00h\nDuracao: 1h",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.pending,
    isSender: true,
  ),
  ChatMessage(
    id_artista: 8,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Ofereceste a Pedro Piaf:\n250€\nDia: 08/05/2023\nHora: 21:00h\nDuracao: 1h30\nDescrição:\nGorjeta se deres show!",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.accepted,
    isSender: true,
  ),
  ChatMessage(
    id_artista: 14,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Ofereceste a Filipe:\n50€\nDia: 19/05/2023\nHora: 22:00h\nDuracao: 1h",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.rejected,
    isSender: true,
  ),
  ChatMessage(
    id_artista: 14,
    id_contratante: 999999, // irrelevante aqui
    text:
        "Filipe propõe:\n100€\nDia: 08/05/2023\nHora: 21:00h\nDuracao: 1h30\nDescrição:\nGorjeta se deres show!",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.pending,
    isSender: false,
  )

  // CHAT WITH CONTRATANT MESSAGES //
];
