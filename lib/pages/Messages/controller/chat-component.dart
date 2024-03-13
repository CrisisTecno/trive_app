import 'package:flutter/material.dart';

class ChatComponent extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatComponent({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          title: Text(message['message']),
          subtitle: Text(message['sender']),
        );
      },
    );
  }
}
