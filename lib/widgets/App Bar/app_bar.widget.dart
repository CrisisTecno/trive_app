import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';



class CustomAppBar extends StatelessWidget {
 
  const CustomAppBar({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {

   
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              
              GestureDetector(
                onTap: () {
                  print('open menu');
                },
                child: SvgPicture.asset(
                  'public/assets/icons/menu.svg',
                  height: 40.h,
                  width: 40.h,
                ),
              ),
          
              GestureDetector(
                onTap: () {
                  print('open menu');
                },
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      
                      SvgPicture.asset(
                        'public/assets/icons/notification.svg',
                        height: 35.h,
                        width: 35.h,
                      ),
                      Positioned(
                        top: 10.h,
                      right: 12.h,
                          child: Container(
                          height: 10.h,
                          width: 10.h,
                          decoration: BoxDecoration(
                              color: Color(0xff53E544),
                              borderRadius: BorderRadius.circular(10.h)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                     Navigator.of(context)
                                  .pushNamed(RouteManager.buypoint);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'public/assets/icons/thunder_blue.svg',
                      height: 35.h,
                      width: 35.h,
                    ),
                    Text('150',style: TextStyle(
                      fontSize: 26.h,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              SizedBox(width: 15.w,)
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:trive_bysc/utils/utils.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:trive_bysc/utils/utils.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
   
//     return Padding(
//       padding:  EdgeInsets.symmetric(vertical: 10.h),
//       child: Column(
//         children: [
//           Row(
//             children: [
              
//               GestureDetector(
//                 onTap: () {
//                   print('open menu');
//                 },
//                 child: SvgPicture.asset(
//                   'public/assets/icons/menu.svg',
//                   height: 40.h,
//                   width: 40.h,
//                 ),
//               ),
          
//               GestureDetector(
//                 onTap: () {
//                   print('open menu');
//                 },
//                 child: Container(
//                   height: 40.h,
//                   width: 40.h,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
                      
//                       SvgPicture.asset(
//                         'public/assets/icons/notification.svg',
//                         height: 35.h,
//                         width: 35.h,
//                       ),
//                       Positioned(
//                         top: 10.h,
//                       right: 12.h,
//                           child: Container(
//                           height: 10.h,
//                           width: 10.h,
//                           decoration: BoxDecoration(
//                               color: Color(0xff53E544),
//                               borderRadius: BorderRadius.circular(10.h)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Spacer(),
//               GestureDetector(
//                 onTap: () {
//                   print('open menu');
//                 },
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                       'public/assets/icons/thunder_blue.svg',
//                       height: 35.h,
//                       width: 35.h,
//                     ),
//                     Text('150',style: TextStyle(
//                       fontSize: 26.h,fontWeight: FontWeight.bold
//                     ),)
//                   ],
//                 ),
//               ),
//               SizedBox(width: 15.w,)
//             ],
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }