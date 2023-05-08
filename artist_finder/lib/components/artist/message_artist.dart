import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/common/url.dart';

import '../common/text_message.dart';
import 'offer_message_artist.dart';

class MessageArtist extends StatelessWidget {
  const MessageArtist({
    Key? key,
    required this.message,
    required this.contratant,
  }) : super(key: key);
  final Contratant contratant;
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.offer:
          return OfferMessageArtist(
            message: message,
            contratant: contratant,
          );
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage('$api/images/DEFAULT.jpg'),
            ),
            const SizedBox(width: 10),
          ],
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Colors.red;
        case MessageStatus.not_view:
          return Colors.grey;
        case MessageStatus.viewed:
          return Colors.blue;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
