import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class MessagesAppBar extends StatelessWidget {
  const MessagesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'public/assets/icons/back.svg',
                  height: 40.h,
                  width: 40.h,
                ),
              ),

              Spacer(),
              // GestureDetector(
              //   onTap: () {
              //     print('open menu');
              //   },
              //   child: GestureDetector(
              //     onTap: (){       Navigator.of(context)
              //                     .pushNamed(RouteManager.buypoint);},
              //     child: Row(
              //       children: [
              //         SvgPicture.asset(
              //           'public/assets/icons/thunder_blue.svg',
              //           height: 35.h,
              //           width: 35.h,
              //         ),
              //         Text('150',style: TextStyle(
              //           fontSize: 26.h,fontWeight: FontWeight.bold
              //         ),)
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
