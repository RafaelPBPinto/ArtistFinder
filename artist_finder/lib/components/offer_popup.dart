import 'package:artist_finder/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class OfferPopUp extends StatelessWidget {
  OfferPopUp({super.key});

  final quantiaController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Fazer proposta'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: quantiaController,
                decoration: const InputDecoration(
                  labelText: 'Quantia',
                  icon: Icon(Icons.euro),
                ),
              ),
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição (opcional)',
                  icon: Icon(Icons.message),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (quantiaController.text.isEmpty) {
              return;
            }
            ChatMessage message;
            String quantia = quantiaController.text;
            String euro = "€";
            String text = "Ofereceste a Pedro Piaf:\n";
            if (descricaoController.text.isEmpty) {
              message = ChatMessage(
                text: '$text$quantia$euro',
                messageType: ChatMessageType.offer,
                messageStatus: MessageStatus.viewed,
                isSender: true,
              );
            } else {
              String descricao = "\nDescrição:\n";
              String descricaoText = descricaoController.text;
              message = ChatMessage(
                text: '$text$quantia$euro$descricao$descricaoText',
                messageType: ChatMessageType.offer,
                messageStatus: MessageStatus.viewed,
                isSender: true,
              );
            }

            demoChatMessages.add(message);
            Navigator.pop(context);
            Navigator.of(context).pushNamed("negotiation");
          },
          child: const Text('Enviar'),
        ),
      ],
    );
  }
}
