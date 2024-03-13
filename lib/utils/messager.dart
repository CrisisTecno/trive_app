// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/messages/message-model.dart';
// import 'package:trive_bysc/utils/messages/user_model.dart';



// class ConnectServices {
//   final BuildContext context;
//   ConnectServices(this.context);

//   String generateCode() {
//     const chars = "0123456789";
//     Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
//     String result = "";
//     for (var i = 0; i < 6; i++) {
//       result += chars[rnd.nextInt(chars.length)];
//     }
//     return result;
//   }

//   Future<String> createChat(UserModel reciverUser) async {
//     String chatID = generateCode();
//     Map<String, dynamic> chatMap = {
//       'id': chatID,
//       'sender': store.user.uid,
//       'reciver': reciverUser.uid,
//       '${reciverUser.uid}': reciverUser.getFullName(),
//       '${store.user.uid}': store.user.getFullName(),
//       'date': DateTime.now(),
//       'users': [
//         reciverUser.uid,
//         store.user.uid,
//       ],
//     };
//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatID)
//         .set(chatMap);

//     return chatID;
//   }

//   sendMessage(content, UserModel reciverUser, String chatID, type, images, link,
//       file, MessageModel? replyMessage) async {
//     // bool pass = !store.user.friends!.contains(reciverUser.uid)
//     //     ? createCharge(store.user, reciverUser.messagesPrice!, context)
//     //     : true;
//     // if (pass) {
//     String messageID = generateCode();
//     MessageModel messageModel = MessageModel(
//         id: messageID,
//         sender: store.user.uid,
//         date: DateTime.now(),
//         message: content,
//         rMessageContent: replyMessage?.message,
//         rMessageId: replyMessage?.id,
//         rMessageSenderName: replyMessage?.userName,
//         userImage: store.user.image,
//         userName: store.user.getFullName(),
//         type: type);

//     switch (type) {
//       case 'Images':
//         messageModel.image = [];
//         for (var i = 0; i < images!.length; i++) {
//           String imageURL = await ImageServices().uploadFile(
//               'messages/${messageID}/${images![i].path.split('/').last}',
//               images![i]);
//           messageModel.image!.add(imageURL);
//         }
//         break;
//       case 'Link':
//         messageModel.link = link;
//         Metadata? metad = await MetadataFetch.extract(link!);
//         messageModel.thumbnail = metad!.image;
//         messageModel.title = metad.title;
//         messageModel.description = metad.description;
//         break;
//       case 'File':
//         messageModel.file = await ImageServices().uploadFile(
//             'messages/${messageID}/${file!.path.split('/').last}', file!);
//         break;
//       default:
//     }

//     UserServices().createNotification(
//       title: '${store.user.getFullName()} te ha enviado un mensaje',
//       content: content,
//       type: 'message',
//       targetUser: reciverUser.uid,
//       id: chatID,
//       senderUser: store.user.uid!,
//     );
//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatID)
//         .update({'date': DateTime.now(), 'lastMessage': content});
//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatID)
//         .collection('messages')
//         .doc(messageID)
//         .set(messageModel.toJson());
//     // }
//   }

//   initChat(UserModel senderUser) async {
//     QuerySnapshot<Map<String, dynamic>> cSnap = await FirebaseFirestore.instance
//         .collection('chats')
//         .where('users', arrayContains: senderUser.uid)
//         .get();
//     if (cSnap.docs.isEmpty) {
//       // String id = await ConnectServices(context).createChat(senderUser);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ContactScreen(
//               user: senderUser,
//               chatID: null,
//             ),
//           ));
//       return;
//     } else {
//       List<QueryDocumentSnapshot<Map<String, dynamic>>> c2Snap = cSnap.docs
//           .where((element) => element['users'].contains(store.user.uid))
//           .toList();
//       if (c2Snap.isEmpty) {
//         // String id = await ConnectServices(context).createChat(senderUser);
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ContactScreen(
//                 user: senderUser,
//                 chatID: null,
//               ),
//             ));
//         return;
//       }
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ContactScreen(
//               user: senderUser,
//               chatID: c2Snap.first.id,
//             ),
//           ));
//     }
//   }

//   connectUser(UserModel connectedUser, UserModel cUser, context) async {
//     // bool pass = createCharge(cUser, connectedUser.connectPrice!, context);
//     // if (pass) {
//     cUser.connectedUsers!.add(connectedUser.uid);
//     UserServices().createNotification(
//       title: '${store.user.getFullName()} te ha solicitad seguir',
//       content: '',
//       type: 'Conexion',
//       targetUser: connectedUser.uid,
//       id: '',
//       senderUser: store.user.uid!,
//     );
//     await UserServices()
//         .updateUser({'connectedUsers': cUser.connectedUsers!}, cUser.uid);
//     UpdateUser(cUser);
//     // }
//   }

//   // bool createCharge(UserModel user, double amount, context) {
//   //   if (user.points! > amount) {
//   //     user.points = user.points! - amount;
//   //     UserServices().updateUser({'points': user.points}, user.uid);
//   //     UpdateUser(user);
//   //     return true;
//   //   }
//   //   Navigator.pop(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => CurrencyScreen(),
//   //       ));
//   //   return false;
//   // }

//   sendFriendRequest(UserModel followedUser) async {
//     DocumentReference<Map<String, dynamic>> userRef =
//         FirebaseFirestore.instance.collection('Users').doc(followedUser.uid);
//     if (store.user.pendingFriends!.contains(followedUser.uid)) {
//       followedUser.pendingFriends!.remove(store.user.uid);
//       store.user.pendingFriends!.remove(followedUser.uid);
//       QuerySnapshot<Map<String, dynamic>> nRef = await userRef
//           .collection('notifications')
//           .where('user', isEqualTo: store.user.uid)
//           .get();
//       List<QueryDocumentSnapshot<Map<String, dynamic>>> nDocs = nRef.docs
//           .where((element) => element['type'] == 'friend request')
//           .toList();
//       nDocs.forEach((element) {
//         userRef.collection('notifications').doc(element.id).delete();
//       });
//     } else {
//       UserServices().createNotification(
//         title: '${store.user.getFullName()} te ha seguido',
//         type: 'friend request',
//         targetUser: followedUser.uid,
//         id: '',
//         content: '',
//         senderUser: store.user.uid!,
//       );
//       followedUser.pendingFriends!.add(store.user.uid);
//       store.user.pendingFriends!.add(followedUser.uid);
//     }
//     UpdateUser(store.user);
//     await UserServices().updateUser(
//         {'pendingFriends': followedUser.pendingFriends}, followedUser.uid);
//     await UserServices().updateUser(
//         {'pendingFriends': store.user.pendingFriends}, store.user.uid);
//   }

//   followUsers(UserModel followedUser) async {
//     DocumentReference<Map<String, dynamic>> userRef =
//         FirebaseFirestore.instance.collection('Users').doc(followedUser.uid);
//     DocumentSnapshot<Map<String, dynamic>> uSnap = await userRef.get();
//     List f = uSnap.data()!['followers'] ?? [];
//     if (store.user.following!.contains(followedUser.uid)) {
//       store.user.following!.remove(followedUser.uid);
//       f.remove(store.user.uid);
//       QuerySnapshot<Map<String, dynamic>> nRef = await userRef
//           .collection('notifications')
//           .where('user', isEqualTo: store.user.uid)
//           .get();
//       List<QueryDocumentSnapshot<Map<String, dynamic>>> nDocs =
//           nRef.docs.where((element) => element['type'] == 'follow').toList();
//       nDocs.forEach((element) {
//         userRef.collection('notifications').doc(element.id).delete();
//       });
//     } else {
//       UserServices().createNotification(
//         title: '${store.user.getFullName()} te ha comenzado a seguir',
//         content: '',
//         type: 'follow',
//         targetUser: followedUser.uid,
//         id: store.user.uid!,
//         senderUser: store.user.uid!,
//       );
//       f.add(store.user.uid);
//       store.user.following!.add(followedUser.uid);
//     }
//     UpdateUser(store.user);
//     followedUser.followers = f;
//     await UserServices()
//         .updateUser({'following': store.user.following}, store.user.uid);
//     await UserServices().updateUser({'followers': f}, followedUser.uid);
//   }
// }
