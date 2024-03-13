import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/utils.dart';

class CardConexion extends StatelessWidget {
  const CardConexion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        height: 290.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff0E0E0E).withOpacity(0.2)),
            borderRadius: BorderRadius.all(Radius.circular(20.h))),
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
              width: 200.w,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.h))),
                    height: 80.h,
                    width: 200.w,
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 100.h,
                      width: 200.w,
                      child: Row(
                        children: [
                          Spacer(),
                          SizedBox(
                            height: 100.h,
                            width: 100.h,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                cardConection,
                                scale: 100.h,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(
                          'public/assets/icons/start_green.svg'),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.h))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.person_profile);
                  },
                  child: Text('Enrique Pablos',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.h,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text('Fundador de Skipeat',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.h,
                        color: Colors.grey)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomLabel(
                      label: '+ 5k',
                      pathSvg: 'public/assets/icons/people.svg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 120.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.h)),
                      color: primary),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.h, vertical: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Conectar',
                          style: TextStyle(
                              fontSize: 18.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        SvgPicture.asset(
                          'public/assets/icons/thunder_blank.svg',
                          height: 20.h,
                          width: 20.h,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
