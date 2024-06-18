import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../widgets/meeting_card.dart';

class SolicitudPart extends StatefulWidget {
  const SolicitudPart({
    super.key,
  });

  @override
  State<SolicitudPart> createState() => _SolicitudPartState();
}

class _SolicitudPartState extends State<SolicitudPart> {
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
      print("mira aca");
      print(triveProvider.personId);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Calls')
          .where('expert', isEqualTo: triveProvider.userId)
          .get();

      List<Map<String, dynamic>> combinedData = [];

      if (querySnapshot.docs.isNotEmpty) {
        // Recorrer todos los documentos de querySnapshot
        for (var callDoc in querySnapshot.docs) {
          var clientUserId = callDoc['client']; // Obtener ID del cliente

          // Consultar los datos del usuario cliente
          DocumentSnapshot clientSnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .doc(clientUserId)
              .get();

          if (clientSnapshot.exists) {
            Map<String, dynamic> clientData =
                clientSnapshot.data() as Map<String, dynamic>;

            Map<String, dynamic> combinedEntry = {
              'id': callDoc.id,
              'callData': callDoc.data(),
              'userData': clientData,
            };
            combinedData.add(combinedEntry);
          } else {
            print(
                'No se encontraron datos para el usuario cliente con ID: $clientUserId');
          }
        }
      } else {
        print(
            'No se encontraron llamadas para el experto con ID: ${triveProvider.userId}');
      }

      // Ahora combinedData contiene todos los datos combinados de las llamadas y usuarios clientes
      print('Datos combinados:');
      print(combinedData);
      print(combinedData[0]);
      print(combinedData[0]['userData']);
      setState(() {
        _data = combinedData;
      });
    } catch (e) {
      print("Error al obtener los datos: $e");
    }
  }

  String formatTime(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime =
        DateFormat.jm().format(dateTime); // Formato '3:00 PM'
    return formattedTime;
  }

  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(dateTime); // Formato '21/10/2023'
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _data.isEmpty
          ? Center(
              child: _data == null || _data.isEmpty
                  ? Text(
                      'No se encontraron Solicitudes',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  var userData = _data[index];
                  Timestamp dateTimestamp = userData['callData']['date'];

                  if (userData['callData']['hour'] is String) {
                    String formattedTime = userData['callData']['hour'];
                    String formattedDate = formatDate(dateTimestamp);
                    return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MeetingCard(
                            status: userData['callData']['status'],
                            id: userData['id'],
                            profileImageUrl: userData['userData']['mainImage'],
                            name: userData['userData']['name'],
                            role: userData['userData']['occupation'],
                            meetingTitle: userData['callData']['purpose'],
                            meetingTime: formattedDate,
                            meetingDate: formattedTime));
                  } else {
                    Timestamp hourTimestamp = userData['callData']['hour'];
                    String formattedTime = formatTime(hourTimestamp);
                    String formattedDate = formatDate(dateTimestamp);
                    return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MeetingCard(
                            status: userData['callData']['status'],
                            id: userData['id'],
                            profileImageUrl: userData['userData']['mainImage'],
                            name: userData['userData']['name'],
                            role: userData['userData']['occupation'],
                            meetingTitle: userData['callData']['purpose'],
                            meetingTime: formattedDate,
                            meetingDate: formattedTime));
                  }

                  // print("User ID: ${userSnapshot.id}");
                  // print("nro. followers " + nroFollowers);
                  // print(userData['name']);
                  // print(userData['mainImage']);
                  // print(userData['occupation']);
                },
              ),
            ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
  //     child: Column(
  //       children: [
  //         MeetingCard(
  //           profileImageUrl:
  //               'https://s3-alpha-sig.figma.com/img/9943/75bb/93f8f8f051ddabe4b4db449db8b1f5b0?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qSkiDy0hPYrTt9agnubtT8KUkRPwGjtkUUCEn36lqDx8hp4nXVoEO8GwZly5ibaDfUqSAqGo7AcViMfg3~RdHdSvP~d7MPFz-4iDEJ4xZV18VqIKa9zzY~0xgnydD5VxxTLvDowNcJe7gyYDlnwM6FznVcnWzM89jYiho6k9REUJNt2CLxtGx-2zVzvxmZPclpkjXHnUyfkxQuwTIHbmlwqKJyWvw0FxoJlXNhcB7~iqdebeyt3sGaqiqqxyHOCu126220zf8E~kheMg7SzAohhgutPUNL7GBt3yZi5c8GsNK7jMDvPKoGnZMiQ5u2pVYEDUvtBY4AgGtfn7~Pi84A__',
  //           name: 'Carlos Mena',
  //           role: 'CEO de Lorem',
  //           meetingTitle: 'Reunión de estrategia comercial para face2.',
  //           meetingTime: '3:00 PM',
  //           meetingDate: '21/10/2023',
  //         ),
  //         MeetingCard(
  //           profileImageUrl:
  //               'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
  //           name: 'Carlos Mena',
  //           role: 'CEO de Lorem',
  //           meetingTitle: 'Reunión de estrategia comercial para face2.',
  //           meetingTime: '3:00 PM',
  //           meetingDate: '21/10/2023',
  //         )
  //       ],
  //     ),
  //   );
  // }
}
