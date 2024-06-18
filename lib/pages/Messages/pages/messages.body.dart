import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/messages_tile.body.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    initializeDateFormatting();
  }

  Future<void> fetchData() async {
    final triveProvider = Provider.of<TriveProvider>(context, listen: false);
    List<Map<String, dynamic>> combinedData = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Chats')
          .where('users', arrayContains: triveProvider.userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          // Obtener datos del chat
          Map<String, dynamic> chatData = doc.data() as Map<String, dynamic>;

          // Obtener IDs de ambos usuarios
          List<String> userIds = List<String>.from(chatData['users']);
          String otherUserId =
              userIds.firstWhere((id) => id != triveProvider.userId);

          // Obtener datos de los usuarios
          DocumentSnapshot currentUserSnapshot = await FirebaseFirestore
              .instance
              .collection('Users')
              .doc(triveProvider.userId)
              .get();
          DocumentSnapshot otherUserSnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .doc(otherUserId)
              .get();

          Map<String, dynamic> currentUserData =
              currentUserSnapshot.data() as Map<String, dynamic>;
          Map<String, dynamic> otherUserData =
              otherUserSnapshot.data() as Map<String, dynamic>;

          // Construir entrada combinada
          Map<String, dynamic> combinedEntry = {
            'id': doc.id,
            'person': currentUserData,
            'otherUser': otherUserData,
            'otherUserId': otherUserId,
            'chat': chatData,
          };

          combinedData.add(combinedEntry);
        }

        setState(() {
          if (mounted) {
            _data = combinedData;
          }
        });
      } else {
        print('No se encontraron documentos que coincidan con la consulta.');
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(dateTime); // Formato '21/10/2023'
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            CustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
              child: SearchWidget(
                label: 'Busca Expertos',
                icon: Icon(
                  Icons.search,
                  size: 40.h,
                  color: primary,
                ),
                borderColor: Colors.black.withOpacity(0.1),
                borderFocusedColor: Color(0xff0E0E0E),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chats',
                    style:
                        TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Filtrar',
                    style:
                        TextStyle(fontSize: 20.h, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 400.h,
              child: _data.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        var userData = _data[index];
                        print(userData['otherUserId']);
                        print(userData['chat']['createAt']);
                        Timestamp dateTimestamp = userData['chat']['createAt'];
                        String formattedDate = formatDate(dateTimestamp);
                        print(formattedDate);
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: MessageTile(
                            personData: userData['otherUser'],
                            id: userData['otherUserId'],
                            imageUrl: userData['otherUser']['mainImage'],
                            name: userData['otherUser']['name'],
                            messagePreview: userData['otherUser']['occupation'],
                            date: formattedDate,
                            messageCount: 1,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
