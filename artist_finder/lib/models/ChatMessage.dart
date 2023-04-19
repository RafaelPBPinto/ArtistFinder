enum ChatMessageType { text, offer }

enum MessageStatus { not_sent, not_view, viewed }

enum OfferStatus { pending, accepted, rejected }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final OfferStatus offerStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
    this.offerStatus = OfferStatus.pending,
  });
}

List demoChatMessages = [
  ChatMessage(
    text: "Olá",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Olá, tudo bem?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Bem e tu?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Também",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
  ChatMessage(
    text: "Ofereceste a Pedro Piaf:\n100€",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.rejected,
    isSender: true,
  ),
  ChatMessage(
    text: "Pedro Piaf propõe:\n250€",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.pending,
    isSender: false,
  ),
  ChatMessage(
    text: "Ofereceste a Pedro Piaf:\n300€\nDescrição:\nGorjeta se deres show!",
    messageStatus: MessageStatus.viewed,
    messageType: ChatMessageType.offer,
    offerStatus: OfferStatus.accepted,
    isSender: true,
  )
];
