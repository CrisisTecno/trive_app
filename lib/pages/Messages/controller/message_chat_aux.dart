
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../../utils/messages/message-model.dart';
// import '../../../utils/models/user.model.dart';

// class ContactScreen extends StatefulWidget {
//   final UserModel user;
//   final String? chatID;
//   const ContactScreen({super.key, required this.user, this.chatID});

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {
//   ScrollController _scrollController = new ScrollController();
//   TextEditingController textEditingController = new TextEditingController();
//   String? chatID;
//   MessageModel? replyMessage;
//   @override
//   void initState() {
//     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     // });
//     chatID = widget.chatID ?? 'a';
//     super.initState();
//   }

//   void _scrollDown() {
//     _scrollController.animateTo(
//       _scrollController.position.minScrollExtent,
//       duration: Duration(seconds: 1),
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   sendMessage(content, type, images, link, file, replyMessage) async {
//     print(content);
//     if (content == '') {
//       return;
//     }
//     String? id = chatID != 'a'
//         ? chatID
//         : await ConnectServices(context).createChat(widget.user);
//     setState(() {
//       chatID = id;
//     });
//     await ConnectServices(context).sendMessage(content ?? '', widget.user, id!,
//         type, images, link, file, replyMessage);
//     _scrollDown();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/topbar_background.png'),
//                       fit: BoxFit.cover),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20)),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//                   child: SafeArea(
//                     top: true,
//                     bottom: false,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         IconButton(
//                             onPressed: () => Navigator.pop(context),
//                             icon: Icon(
//                               Icons.arrow_back_ios,
//                               color: Colors.white,
//                             )),
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(widget.user.image!),
//                           backgroundColor: accentColor,
//                           radius: 25,
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Expanded(
//                           child: Text(
//                             widget.user.getFullName(),
//                             maxLines: 2,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: 16),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                     stream: FirebaseFirestore.instance
//                         .collection('chats')
//                         .doc(chatID)
//                         .collection('messages')
//                         .orderBy('date', descending: true)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Container();
//                       }
//                       return ListView.builder(
//                         controller: _scrollController,
//                         padding: EdgeInsets.only(bottom: 60.0, top: 20),
//                         reverse: true,
//                         primary: false,
//                         shrinkWrap: true,
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, i) {
//                           MessageModel m = MessageModel.fromMap(
//                               snapshot.data!.docs[i].data(),
//                               snapshot.data!.docs[i].id);
//                           // QueryDocumentSnapshot<Map<String, dynamic>> doc =
//                           //     snapshot.data!.docs[i];
//                           // bool seen = m. == null
//                           //     ? false
//                           //     : doc.data()['seen'];
//                           // bool image = i == 0
//                           //     ? true
//                           //     : snapshot.data!.docs[i - 1].data()['sender'] !=
//                           //         doc.data()['sender'];
//                           return MessageTile(
//                             onReplyMessage: (m) {
//                               setState(() {
//                                 replyMessage = m;
//                               });
//                             },
//                             messageModel: m,
//                             seen: false,
//                           );
//                         },
//                       );
//                     }),
//               ))
//             ],
//           ),
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: Material(
//                   elevation: 4,
//                   type: MaterialType.canvas,
//                   child: NewCommentWidget(
//                     isMessage: true,
//                     deleteReplyMessage: () {
//                       setState(() {
//                         replyMessage = null;
//                       });
//                     },
//                     replyMessage: replyMessage,
//                     onSummit: (content, type, images, link, file) async {
//                       await sendMessage(
//                           content, type, images, link, file, replyMessage);
//                       setState(() {
//                         replyMessage = null;
//                       });
//                     },
//                     // post: PostModel(),
//                     // updateComments: () {},
//                   )))
//         ],
//       ),
//     );
//   }
// }

// // class MessageTile extends StatelessWidget {
// //   final String message;
// //   final bool image;
// //   final bool isSentByMe;
// //   final UserModel user;
// //   final bool seen;

// //   MessageTile(this.seen, this.message, this.isSentByMe, this.user, this.image);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
// //       padding: EdgeInsets.only(left: 20, right: 20),
// //       margin: EdgeInsets.only(bottom: image ? 15 : 5),
// //       width: MediaQuery.of(context).size.width,
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         crossAxisAlignment:
// //             isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.end,
// //             mainAxisAlignment:
// //                 isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// //             children: [
// //               if (!isSentByMe)
// //                 Padding(
// //                   padding: EdgeInsets.only(right: 10),
// //                   child: CircleAvatar(
// //                     backgroundColor: Colors.transparent,
// //                     backgroundImage:
// //                         image ? NetworkImage(user.image ?? '') : null,
// //                     radius: 20,
// //                   ),
// //                 ),
// //               Expanded(
// //                 child: Align(
// //                   alignment:
// //                       isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
// //                   child: Container(
// //                     padding:
// //                         EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
// //                     decoration: BoxDecoration(
// //                         color: isSentByMe ? appColor : Colors.white,
// //                         boxShadow: [
// //                           BoxShadow(
// //                               color: Colors.grey[200]!,
// //                               spreadRadius: .8,
// //                               blurRadius: 5)
// //                         ],
// //                         borderRadius: isSentByMe
// //                             ? BorderRadius.only(
// //                                 topLeft: Radius.circular(23.0),
// //                                 topRight: Radius.circular(23.0),
// //                                 bottomLeft: Radius.circular(23.0),
// //                               )
// //                             : BorderRadius.only(
// //                                 topLeft: Radius.circular(23.0),
// //                                 topRight: Radius.circular(23.0),
// //                                 bottomRight: Radius.circular(23.0),
// //                               )),
// //                     child: Text(
// //                       message,
// //                       style: TextStyle(
// //                           color: isSentByMe ? Colors.white : Colors.black,
// //                           fontSize: 14.0),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               // if (isSentByMe)
// //               //   Padding(
// //               //     padding: const EdgeInsets.only(left: 10),
// //               //     child: CircleAvatar(
// //               //       backgroundColor: Colors.transparent,
// //               //       backgroundImage:
// //               //           image ? NetworkImage(store.user.image ?? '') : null,
// //               //       radius: 25,
// //               //     ),
// //               //   ),
// //             ],
// //           ),
// //           // !image
// //           //     ? Container()
// //           //     :
// //           //     // : seen
// //           //     Text('Visto')
// //           // // : Container()
// //         ],
// //       ),
// //     );
// //   }
// // }
