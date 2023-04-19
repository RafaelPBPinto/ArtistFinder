import 'package:flutter/material.dart';
import 'package:artist_finder/components/offer_popup.dart';
import 'package:artist_finder/models/ChatMessage.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showOfferPopUp() {
      showDialog(
        context: context,
        builder: (context) => OfferPopUp(),
      );
    }

    void sendMessage() {
      if (textController.text.isEmpty) {
        return;
      }
      ChatMessage message = ChatMessage(
        text: textController.text,
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.not_view,
        isSender: true,
      );
      textController.clear();
      demoChatMessages.add(message);
      // refresh the chat screen
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed("negotiation");
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
