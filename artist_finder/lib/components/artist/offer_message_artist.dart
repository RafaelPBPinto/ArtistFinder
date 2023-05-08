import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/pages/artist/negotiation_artist.dart';

class OfferMessageArtist extends StatelessWidget {
  const OfferMessageArtist({
    Key? key,
    required this.message,
    required this.contratant,
  }) : super(key: key);

  final ChatMessage message;
  final Contratant contratant;

  void removeMessage(int id) {}

  void rejeitar(ChatMessage message, BuildContext context) {
    demoChatMessages.removeAt(message.id);
    demoChatMessages.insert(
        message.id,
        ChatMessage(
            id_artista: message.id_artista,
            id_contratante: message.id_contratante,
            text: message.text,
            messageType: ChatMessageType.offer,
            messageStatus: MessageStatus.viewed,
            offerStatus: OfferStatus.rejected,
            isSender: message.isSender));
    // refresh the chat screen
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NegotiationArtistPage(contratant: contratant)));
  }

  void aceitar(ChatMessage message, BuildContext context) {
    demoChatMessages.removeAt(message.id);
    demoChatMessages.insert(
        message.id,
        ChatMessage(
            id_artista: message.id_artista,
            id_contratante: message.id_contratante,
            text: message.text,
            messageType: ChatMessageType.offer,
            messageStatus: MessageStatus.viewed,
            offerStatus: OfferStatus.accepted,
            isSender: message.isSender));
    // refresh the chat screen
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NegotiationArtistPage(contratant: contratant)));
  }

  @override
  Widget build(BuildContext context) {
    switch (message.offerStatus) {
      case OfferStatus.pending:
        return buildPendingOffer(context);
      case OfferStatus.accepted:
        return buildAcceptedOffer(context);
      case OfferStatus.rejected:
        return buildRejectedOffer(context);
      default:
        return const SizedBox();
    }
  }

  Container buildPendingOffer(BuildContext context) {
    switch (message.isSender) {
      case true:
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(message.isSender ? 1 : 0.1),
          ),
          child: Column(
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color: message.isSender ? Colors.white : Colors.blue,
                ),
              ),
              Text(
                "Proposta Pendente",
                style: TextStyle(
                  color: message.isSender ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      case false:
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(message.isSender ? 1 : 0.1),
          ),
          child: Column(
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color: message.isSender ? Colors.white : Colors.blue,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => rejeitar(message, context),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Rejeitar'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => aceitar(message, context),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Aceitar'),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  Container buildAcceptedOffer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(message.isSender ? 1 : 0.1),
      ),
      child: Column(
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.blue,
            ),
          ),
          Text(
            "Proposta Aceite",
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Container buildRejectedOffer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(message.isSender ? 1 : 0.1),
      ),
      child: Column(
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.blue,
            ),
          ),
          Text(
            "Proposta Recusada",
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
