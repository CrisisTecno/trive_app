import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  // late Stream<QuerySnapshot> _messagesStream;
  TextEditingController _messageController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // _messagesStream = FirebaseFirestore.instance
    //     .collection('chats')
    //     .doc("368264")
    //     .collection('messages')
    //     .orderBy('timestamp', descending: true)
    //     .snapshots();
    // _messageController = TextEditingController();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final streamChat = FirebaseFirestore.instance
        .collection('chats')
        .doc("494255")
        .collection('messages')
        // .orderBy('timestamp', descending: true)
        .snapshots();
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : StreamBuilder<QuerySnapshot>(
            stream: streamChat,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("NO HAY DATOS"),
                );
              }
              return Container(
                padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                // width: 200,
                // color: Colors.green,
                child: ListView.builder(
                  // padding: EdgeInsets.only(bottom: 60.0, top: 20),
                  // reverse: true,
                  // primary: false,
                  // shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data!.docs[index];
                    final isCurrentUserMessage =
                        message['sender'] == "hUSX2j5WJSPdWP0c12nEU6zajKA3";

                    return Row(
                      mainAxisAlignment: isCurrentUserMessage
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 2,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: isCurrentUserMessage ? primary : secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message["message"],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );

                    // contentPadding:
                    //     EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.0),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(
                    //         isCurrentUserMessage ? 20.0 : 0.0),
                    //     topRight: Radius.circular(
                    //         isCurrentUserMessage ? 0.0 : 20.0),
                    //     bottomLeft: Radius.circular(20.0),
                    //     bottomRight: Radius.circular(20.0),
                    //   ),
                    // ),
                  },
                ),
              );
            },
          );
  }

  void sendMessage(String message) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc("368264")
        .collection('messages')
        .add({
      'message': message,
      'sender': 'hUSX2j5WJSPdWP0c12nEU6zajKA3',
      'timestamp': DateTime.now(),
    });

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatWidget extends StatefulWidget {
//   const ChatWidget({Key? key}) : super(key: key);

//   @override
//   _ChatWidgetState createState() => _ChatWidgetState();
// }

// class _ChatWidgetState extends State<ChatWidget> {
//   late Stream<QuerySnapshot<Map<String, dynamic>>> _messagesStream;
//   late TextEditingController _messageController;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _messageController = TextEditingController();
//     _fetchMessages();
//   }

//   Future<void> _fetchMessages() async {
//     _messagesStream = FirebaseFirestore.instance
//         .collection('chats')
//         .doc("368264")
//         .collection('messages')
//         .orderBy('timestamp', descending: true)
//         .snapshots();

//     // Simula un retraso de 5 segundos antes de mostrar los mensajes
//     await Future.delayed(Duration(seconds: 5));

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   color: Colors.amber,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 50),
//                     child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                       stream: _messagesStream,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                           return Center(
//                             child: Text("NO HAY DATOS"),
//                           );
//                         }
//                         return ListView.builder(
//                           padding: EdgeInsets.only(bottom: 60.0, top: 20),
//                           reverse: true,
//                           primary: false,
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             final message = snapshot.data!.docs[index];
//                             bool isCurrentUserMessage = message['sender'] ==
//                                 "hUSX2j5WJSPdWP0c12nEU6zajKA3";
//                             return ListTile(
//                               title: Text(message['message']),
//                               tileColor: isCurrentUserMessage
//                                   ? const Color.fromARGB(255, 76, 120, 155)
//                                   : const Color.fromARGB(255, 227, 96, 96),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 16.0, vertical: 8.0),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(
//                                       isCurrentUserMessage ? 20.0 : 0.0),
//                                   topRight: Radius.circular(
//                                       isCurrentUserMessage ? 0.0 : 20.0),
//                                   bottomLeft: Radius.circular(20.0),
//                                   bottomRight: Radius.circular(20.0),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _messageController,
//                         decoration: InputDecoration(hintText: 'Type a message'),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.send),
//                       onPressed: () {
//                         sendMessage(_messageController.text);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//   }

//   void sendMessage(String message) {
//     FirebaseFirestore.instance
//         .collection('chats')
//         .doc("368264")
//         .collection('messages')
//         .add({
//       'message': message,
//       'sender': 'hUSX2j5WJSPdWP0c12nEU6zajKA3',
//       'timestamp': DateTime.now(),
//     });

//     _messageController.clear();
//   }

//   @override
//   void dispose() {
//     _messageController.dispose();
//     super.dispose();
//   }
// }
