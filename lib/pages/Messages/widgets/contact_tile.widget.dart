import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/pages/Messages/widgets/contac_card.widget.dart';
import 'package:trive_bysc/utils/utils.dart';

class ContactTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String position;

  const ContactTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.position,
  }) : super(key: key);

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      color: primary,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: ContactCard(
                      onChanged: () {},
                      profileImageUrl:
                          'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
                      svgIconUrl: 'https://url_to_the_svg_icon',
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 90.h,
              height: 90.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'public/assets/loadings/lo3.gif',
                  image: widget.imageUrl,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'public/assets/images/background_1.png',
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.position,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            //aca para la agenda
            onTap: () {
              Navigator.of(context).pushNamed(RouteManager.dairy);
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  'public/assets/icons/video.svg',
                  height: 40.h,
                  width: 40.h,
                ),
                SizedBox(width: 3.h),
                Text(
                  'Agendar',
                  style: TextStyle(fontSize: 15.h, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
