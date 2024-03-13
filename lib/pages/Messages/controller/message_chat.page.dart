import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/images_network.dart';

import '../widgets/app_bar.chat.widget.dart';
import '../widgets/contact_tile.widget.dart';
import '../widgets/custom_input_field.widget.dart';
import 'chat.widget.dart';
import 'chat_history.dart';

class MessagesChatScreen extends StatelessWidget {
  const MessagesChatScreen({super.key});
  Future<String?> getChatID() async {
    const messages = '824953';
    const iam = 'hUSX2j5WJSPdWP0c12nEU6zajKA3';
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('chats')
        .doc(messages)
        .get();

    print(documentSnapshot.data());

    if (documentSnapshot.exists) {
      QuerySnapshot<Map<String, dynamic>> messagesSnapshot =
          await FirebaseFirestore.instance
              .collection('chats')
              .doc(messages)
              .collection('messages')
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> message
          in messagesSnapshot.docs) {
        // Accede al campo 'sender' dentro de los datos del documento
        String? sender = message.data()['sender'];

        // Verifica si el remitente del mensaje es igual al usuario actual
        if (sender != iam) {
          // Imprime los datos del mensaje
          print(message.data());
        }
      }
    } else {
      print('El documento no existe');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: window.width,
            height: window.height * 0.989,
            child: Column(
              children: [
                MessagesAppBar(),
                ContactTile(
                  imageUrl: cardConection,
                  name: 'Carla Mendoza',
                  position: 'CEO de Lorem',
                ),
                Text("data"),
                ChatWidget(chatID: "368264"),
                // Container(
                //   height: 500,
                //   color: Colors.amber,
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 50),
                //     child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                //       stream: FirebaseFirestore.instance
                //           .collection('chats')
                //           .doc("368264")
                //           .collection('messages')
                //           .orderBy('timestamp', descending: true)
                //           .snapshots(),
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState ==
                //             ConnectionState.waiting) {
                //           return Center(
                //             child: CircularProgressIndicator(),
                //           );
                //         }
                //         if (snapshot.hasError ||
                //             snapshot.data == null ||
                //             snapshot.data!.docs.isEmpty) {
                //           return Center(
                //             child: Text("NO HAY DATOS"),
                //           );
                //         }
                //         return ListView.builder(
                //           padding: EdgeInsets.only(bottom: 60.0, top: 20),
                //           reverse: true,
                //           primary: false,
                //           shrinkWrap: true,
                //           itemCount: snapshot.data!.docs.length,
                //           itemBuilder: (context, index) {
                //             final message = snapshot.data!.docs[index];
                //             bool isCurrentUserMessage = message['sender'] ==
                //                 "hUSX2j5WJSPdWP0c12nEU6zajKA3";
                //             return ListTile(
                //               title: Text(message['message']),
                //               tileColor: isCurrentUserMessage
                //                   ? const Color.fromARGB(255, 76, 120, 155)
                //                   : const Color.fromARGB(255, 227, 96, 96),
                //               contentPadding: EdgeInsets.symmetric(
                //                   horizontal: 16.0, vertical: 8.0),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(
                //                       isCurrentUserMessage ? 20.0 : 0.0),
                //                   topRight: Radius.circular(
                //                       isCurrentUserMessage ? 0.0 : 20.0),
                //                   bottomLeft: Radius.circular(20.0),
                //                   bottomRight: Radius.circular(20.0),
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //       },
                //     ),
                //   ),
                // ),
                // Spacer(),
                Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                  child: CustomInputField(
                    onMicTap: () {},
                    onPlusTap: getChatID,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MessagesChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<MessagesChatScreen> {
//   late Stream<QuerySnapshot<Map<String, dynamic>>> _messagesStream;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _messagesStream = FirebaseFirestore.instance
//         .collection('chats')
//         .doc("368264")
//         .collection('messages')
//         .orderBy('timestamp', descending: true)
//         .snapshots();

//     Future.delayed(Duration(seconds: 5), () {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Screen'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//               height: 500,
//               color: Colors.amber,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                   stream: _messagesStream,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return Center(
//                         child: Text("NO HAY DATOS"),
//                       );
//                     }
//                     return ListView.builder(
//                       padding: EdgeInsets.only(bottom: 60.0, top: 20),
//                       reverse: true,
//                       primary: false,
//                       shrinkWrap: true,
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         final message = snapshot.data!.docs[index];
//                         bool isCurrentUserMessage =
//                             message['sender'] == "hUSX2j5WJSPdWP0c12nEU6zajKA3";
//                         return ListTile(
//                           title: Text(message['message']),
//                           tileColor: isCurrentUserMessage
//                               ? const Color.fromARGB(255, 76, 120, 155)
//                               : const Color.fromARGB(255, 227, 96, 96),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(
//                                   isCurrentUserMessage ? 20.0 : 0.0),
//                               topRight: Radius.circular(
//                                   isCurrentUserMessage ? 0.0 : 20.0),
//                               bottomLeft: Radius.circular(20.0),
//                               bottomRight: Radius.circular(20.0),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//     );
//   }
// }
