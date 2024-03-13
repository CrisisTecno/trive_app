import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String chatID;

  const ChatWidget({
    Key? key,
    required this.chatID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
            if (snapshot.hasError ||
                snapshot.data == null ||
                snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("NO HAY DATOS"),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(bottom: 60.0, top: 20),
              reverse: true,
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final message = snapshot.data!.docs[index];
                bool isCurrentUserMessage =
                    message['sender'] == "hUSX2j5WJSPdWP0c12nEU6zajKA3";
                return ListTile(
                  title: Text(message['message']),
                  tileColor: isCurrentUserMessage
                      ? const Color.fromARGB(255, 76, 120, 155)
                      : const Color.fromARGB(255, 227, 96, 96),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(isCurrentUserMessage ? 20.0 : 0.0),
                      topRight:
                          Radius.circular(isCurrentUserMessage ? 0.0 : 20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
