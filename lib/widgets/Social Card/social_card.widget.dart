import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/utils.dart';

class SocialCard extends StatefulWidget {
  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  bool isFavorite = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row(
          //   children: [
          //     ListTile(
          //       leading: CircleAvatar(
          //         backgroundImage: NetworkImage(
          //             'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__'), // Reemplaza con tu URL
          //       ),
          //       title: Text(
          //         'Mark Zuck',
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.h),
          //       ),
          //       subtitle: Text(
          //         'CEO de Facebook',
          //         style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.h),
          //       ),

          //       //           trailing: IconButton(
          //       //               splashColor: Colors.transparent,
          //       // highlightColor: Colors.transparent,
          //       //             icon: Icon(isFavorite ? Icons.star : Icons.star_border,size: 30.h,),
          //       //             color: isFavorite ? Color(0xff53E544) : Colors.black.withOpacity(0.3),
          //       //             onPressed: () {
          //       //               setState(() {
          //       //                 isFavorite = !isFavorite;
          //       //               });
          //       //             },
          //       //           ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           isFavorite = !isFavorite;
          //         });
          //       },
          //       child: Container(
          //         height: 40.h,
          //         width: 40.h,
          //         padding: EdgeInsets.all(6.h),
          //         child: SvgPicture.asset(isFavorite
          //             ? 'public/assets/icons/start_green.svg'
          //             : 'public/assets/icons/start_grey.svg'),
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.all(Radius.circular(20.h))),
          //       ),
          //     ),
          //   ],
          // ),

          Padding(
            padding: EdgeInsets.only(
                left: 15.h, right: 15.h, top: 15.h, bottom: 5.h),
            child: Row(
              children: [
                CircleAvatar(
                  minRadius: 30.h,
                  backgroundImage: NetworkImage(cardConection),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mark Zuck',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.h),
                      ),
                      Text(
                        'CEO de Facebook',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15.h),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        padding: EdgeInsets.all(5.h),
                        child: SvgPicture.asset(isFavorite
                            ? 'public/assets/icons/start_green.svg'
                            : 'public/assets/icons/start_grey.svg'), // Ajusta la ruta según tu proyecto
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(20.h)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        padding: EdgeInsets.all(5.h),
                        child: SvgPicture.asset(
                            'public/assets/icons/options.svg'), // Ajusta la ruta según tu proyecto
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(20.h)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Un consejo que le doy a todas las personas que quieren fundar una startup es que sean buenos e inteligentes. #negocios',
                ),
                Text('#negocios', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                publish,
                fit: BoxFit.fill,
                width: screensize.width,
                height: screensize.height * 0.2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.h),
            child: Row(
              children: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  color: isLiked ? primary : Colors.black.withOpacity(0.3),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                Text('210'),
                IconButton(
                  icon: Icon(Icons.mode_comment_outlined),
                  color: Colors.black.withOpacity(0.3),
                  onPressed: () {},
                ),
                Text('2'),
                IconButton(
                  icon: Icon(Icons.reply),
                  color: Colors.black.withOpacity(0.3),
                  onPressed: () {},
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Positioned(
//                     top: 10,
//                     right: 10,
//                     child: Container(
//                       height: 40.h,
//                       width: 40.h,
//                       padding: EdgeInsets.all(6.h),
//                       child: SvgPicture.asset(
//                           'public/assets/icons/start_green.svg'),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(20.h))),
//                     ),
//                   ),
