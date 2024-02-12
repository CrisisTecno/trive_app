import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';



class MessagesAppBarPubish extends StatelessWidget {
 
  const MessagesAppBarPubish({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {

   
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                          .pop();
                },
                child: SvgPicture.asset(
                  'public/assets/icons/x.svg',
                  height: 40.h,
                  width: 40.h,
                ),
              ),
          
              Spacer(),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

