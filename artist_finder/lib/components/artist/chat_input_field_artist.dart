import 'offer_pop_up_artist.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:artist_finder/pages/artist/negotiation_artist.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/models/ChatMessage.dart';

class ChatInputFieldArtist extends StatelessWidget {
  Contratant contratant;
  ChatInputFieldArtist({super.key, required this.contratant});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showOfferPopUp() {
      showDialog(
        context: context,
        builder: (context) => OfferPopUpArtist(
          contratant: contratant,
        ),
      );
    }

    void sendMessage() {
      if (textController.text.isEmpty) {
        return;
      }
      ChatMessage message = ChatMessage(
        id_artista: 9999,
        id_contratante: contratant.id,
        text: textController.text,
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.not_view,
        isSender: true,
      );
      textController.clear();
      demoChatMessages.add(message);
      // refresh the chat screen
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NegotiationArtistPage(
                    contratant: contratant,
                  )));
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: Row(children: [
          ElevatedButton(
              onPressed: showOfferPopUp,
              child: const Text(
                "Fazer\nProposta",
              )),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: "Mensagem",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: sendMessage),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
