import 'package:flutter/material.dart';
import 'package:artist_finder/components/chat_input_field.dart';
import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/components/message.dart';

class NegotiationBody extends StatelessWidget {
  const NegotiationBody({super.key});

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