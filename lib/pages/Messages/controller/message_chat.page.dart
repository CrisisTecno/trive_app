import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Container(
      //   height: 150,
      //   width: 200,
      //   color: Colors.green,
      //   child: ListView.builder(
      //     itemBuilder: (context, index) {
      //       return Text("$index");
      //     },
      //   ),
      // )
      body: SafeArea(
        child: Column(
          children: [
            MessagesAppBar(),
            ContactTile(
              imageUrl: cardConection,
              name: 'Carla Mendoza',
              position: 'CEO de Lorem',
            ),
            // Container(
            //   color: Colors.red,
            //   child: ChatWidget(),
            //   height: window.height * 0.6,
            //   width: double.infinity,
            // ),
            Expanded(child: ChatWidget()),
            // Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10.h, left: 10.h, bottom: 10.h),
              child: CustomInputField(
                onMicTap: () {},
                onPlusTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
