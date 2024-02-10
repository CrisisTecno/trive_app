import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../widgets/meeting_card.dart';
class SolicitudPart extends StatelessWidget {
  const SolicitudPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 7.h,right: 7.h,top: 25.h),
      child: Column(
        children: [
          MeetingCard(
      profileImageUrl: 'https://s3-alpha-sig.figma.com/img/9943/75bb/93f8f8f051ddabe4b4db449db8b1f5b0?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qSkiDy0hPYrTt9agnubtT8KUkRPwGjtkUUCEn36lqDx8hp4nXVoEO8GwZly5ibaDfUqSAqGo7AcViMfg3~RdHdSvP~d7MPFz-4iDEJ4xZV18VqIKa9zzY~0xgnydD5VxxTLvDowNcJe7gyYDlnwM6FznVcnWzM89jYiho6k9REUJNt2CLxtGx-2zVzvxmZPclpkjXHnUyfkxQuwTIHbmlwqKJyWvw0FxoJlXNhcB7~iqdebeyt3sGaqiqqxyHOCu126220zf8E~kheMg7SzAohhgutPUNL7GBt3yZi5c8GsNK7jMDvPKoGnZMiQ5u2pVYEDUvtBY4AgGtfn7~Pi84A__',
      name: 'Carlos Mena',
      role: 'CEO de Lorem',
      meetingTitle: 'Reunión de estrategia comercial para face2.',
      meetingTime: '3:00 PM',
      meetingDate: '21/10/2023',
    ),
          MeetingCard(
      profileImageUrl: 'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
      name: 'Carlos Mena',
      role: 'CEO de Lorem',
      meetingTitle: 'Reunión de estrategia comercial para face2.',
      meetingTime: '3:00 PM',
      meetingDate: '21/10/2023',
    )
    
        ],
      ),
    );
  }
}
