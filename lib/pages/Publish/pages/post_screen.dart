import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/app_bar.publish.dart';
import '../widgets/chip_publish_privacity.dart';
import '../widgets/choice_chip.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MessagesAppBarPubish(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.h,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/8189/2832/94e37838f054caf199bf848a4cfc50c1?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L36PDln5lIfwpdO3LwJ9gm~9D4KdBak2sdpWn6CaCL9gt28v4FbJ-WXQyKEId4VQTANQEuJOHe-Wt15MKLqaLMr0EJt3Kf1lP1eAi~RocAPo52rkdsXLAky-YGFbdyQGc1Rvwe9pmFkfn88U2BK4K8yak8TZYhi58oBwh6nkK5Jy627sI9GUnvd0ObNrU6GOv7shkogBBHvW6rkva7x1-ygB8m3KJyvnz~DJiHr3L7GF-hpHS~afnc0cAUs2Oej~1VCENcZS2WUw26d0RU95tppPmxsvKHZ1Yo6yzy4VYHxLuCkgLONJRkU6Bf-R~gTIZUd3TTSrJTVKfbHTMZc9Rg__',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enrique Pablos',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 15.h,
                      ),
                      ChipOptionPublishPrivacity(label: 'Publicar',),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '¿Qué estás pensando?',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Elige una imagen'),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Container(
                    width:
                        100.0, 
                    height: 100.0, 
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(
                        8.0), 
                  );
                }),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
        
                SvgPicture.asset( 'public/assets/icons/galery.svg',),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 2.h),
                        height: 30.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.h)),
                            color: primary),
                  child: SvgPicture.asset( 'public/assets/icons/camera_2.svg',)
                  ),
                SvgPicture.asset( 'public/assets/icons/+.svg',),
              ],
            ),
            SizedBox(height: 20.h,),
            CustomButton(
                  onClick: () {
                  },
                  title: 'Publicar',
                  backgroundColor: primary,
                  titleColor: Colors.white,
                ),
                SizedBox(height: 20.h,),
          ],
        ),

      ),
    );
  }
}

