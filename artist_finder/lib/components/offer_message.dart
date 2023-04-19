import 'package:artist_finder/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class OfferMessage extends StatelessWidget {
  const OfferMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    switch (message!.offerStatus) {
      case OfferStatus.pending:
        return buildPendingOffer();
      case OfferStatus.accepted:
        return buildAcceptedOffer();
      case OfferStatus.rejected:
        return buildRejectedOffer();
      default:
        return const SizedBox();
    }
  }

  Container buildPendingOffer() {
    switch (message!.isSender) {
      case true:
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(message!.isSender ? 1 : 0.1),
          ),
          child: Column(
            children: [
              Text(
                message!.text,
                style: TextStyle(
                  color: message!.isSender ? Colors.white : Colors.blue,
                ),
              ),
              Text(
                "Proposta Pendente",
                style: TextStyle(
                  color: message!.isSender ? Colors.white : Colors.blue,
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
            color: Colors.grey.withOpacity(message!.isSender ? 1 : 0.1),
          ),
          child: Column(
            children: [
              Text(
                message!.text,
                style: TextStyle(
                  color: message!.isSender ? Colors.white : Colors.blue,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Rejeitar'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => {},
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

  Container buildAcceptedOffer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(message!.isSender ? 1 : 0.1),
      ),
      child: Column(
        children: [
          Text(
            message!.text,
            style: TextStyle(
              color: message!.isSender ? Colors.white : Colors.blue,
            ),
          ),
          Text(
            "Proposta Aceite",
            style: TextStyle(
              color: message!.isSender ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Container buildRejectedOffer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(message!.isSender ? 1 : 0.1),
      ),
      child: Column(
        children: [
          Text(
            message!.text,
            style: TextStyle(
              color: message!.isSender ? Colors.white : Colors.blue,
            ),
          ),
          Text(
            "Proposta Recusada",
            style: TextStyle(
              color: message!.isSender ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
