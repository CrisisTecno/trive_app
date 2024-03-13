import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHistory extends StatelessWidget {
  final String chatID;
  final String currentUserID;

  const ChatHistory({
    required this.chatID,
    required this.currentUserID,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatID)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return Center(
            child: Text('No se pudo cargar el chat.'),
          );
        }
        return ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(8.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final message = snapshot.data!.docs[index];
            bool isCurrentUserMessage = message['sender'] == currentUserID;
            return ListTile(
              title: Text(message['message']),
              tileColor: isCurrentUserMessage
                  ? const Color.fromARGB(255, 76, 120, 155)
                  : const Color.fromARGB(255, 227, 96, 96),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isCurrentUserMessage ? 20.0 : 0.0),
                  topRight: Radius.circular(isCurrentUserMessage ? 0.0 : 20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
