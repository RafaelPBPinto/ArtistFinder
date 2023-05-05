import 'package:flutter/material.dart';
import 'package:artist_finder/components/chat_input_field.dart';
import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/components/message.dart';
import 'package:artist_finder/models/Artist.dart';

class NegotiationBody extends StatelessWidget {
  final Artist artist;
  const NegotiationBody({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: demoChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demoChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
