import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/images_network.dart';

import '../widgets/app_bar.chat.widget.dart';
import '../widgets/contact_tile.widget.dart';
import '../widgets/custom_input_field.widget.dart';
import 'chat.widget.dart';
import 'chat_history.dart';

class MessagesChatScreen extends StatefulWidget {
  const MessagesChatScreen({super.key});

  @override
  State<MessagesChatScreen> createState() => _MessagesChatScreenState();
}

class _MessagesChatScreenState extends State<MessagesChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final triveProvider = Provider.of<TriveProvider>(context, listen: false);

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
              imageUrl: triveProvider.personData?['mainImage'] ?? '',
              name: triveProvider.personData?['name'] ?? '',
              position: triveProvider.personData?['occupation'] ?? '',
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
