import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';

import '../widgets/app_bar.chat.widget.dart';
import '../widgets/contact_tile.widget.dart';
import '../widgets/custom_input_field.widget.dart';

class MessagesChatScreen extends StatelessWidget {
  const MessagesChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Size window = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: window.width,
            height: window.height*0.989,
            child: Column(
              children: [
                MessagesAppBar(),
                ContactTile(
                  imageUrl:
                      'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
                  name: 'Carla Mendoza',
                  position: 'CEO de Lorem',
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                  child: CustomInputField(
                    onMicTap: () {},
                    onPlusTap: () {},
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
