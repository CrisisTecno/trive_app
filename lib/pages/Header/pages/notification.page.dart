import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Header/widgets/card_notification.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/utils.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MessagesAppBar(),
              TitleNotification(label: 'Hoy'),
              SizedBox(height: 20.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    CardNotification(
                            profileImageUrl:
                                'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
                            userName: 'Carlos Mena',
                            actionText: 'Compartió tu publicación',
                            timeAgo: 'Hace 2 hora',
                          ),
                    CardNotification(
                            profileImageUrl:
                                'https://s3-alpha-sig.figma.com/img/9943/75bb/93f8f8f051ddabe4b4db449db8b1f5b0?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qSkiDy0hPYrTt9agnubtT8KUkRPwGjtkUUCEn36lqDx8hp4nXVoEO8GwZly5ibaDfUqSAqGo7AcViMfg3~RdHdSvP~d7MPFz-4iDEJ4xZV18VqIKa9zzY~0xgnydD5VxxTLvDowNcJe7gyYDlnwM6FznVcnWzM89jYiho6k9REUJNt2CLxtGx-2zVzvxmZPclpkjXHnUyfkxQuwTIHbmlwqKJyWvw0FxoJlXNhcB7~iqdebeyt3sGaqiqqxyHOCu126220zf8E~kheMg7SzAohhgutPUNL7GBt3yZi5c8GsNK7jMDvPKoGnZMiQ5u2pVYEDUvtBY4AgGtfn7~Pi84A__',
                            userName: 'Carlos Mena',
                            actionText: 'Compartió tu publicación',
                            timeAgo: 'Hace 2 hora',
                          ),
                  ],
                ),
              ),
              
              TitleNotification(label: 'Ayer'),
              SizedBox(height: 20.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    CardNotification(
                            profileImageUrl:
                                'https://s3-alpha-sig.figma.com/img/9943/75bb/93f8f8f051ddabe4b4db449db8b1f5b0?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qSkiDy0hPYrTt9agnubtT8KUkRPwGjtkUUCEn36lqDx8hp4nXVoEO8GwZly5ibaDfUqSAqGo7AcViMfg3~RdHdSvP~d7MPFz-4iDEJ4xZV18VqIKa9zzY~0xgnydD5VxxTLvDowNcJe7gyYDlnwM6FznVcnWzM89jYiho6k9REUJNt2CLxtGx-2zVzvxmZPclpkjXHnUyfkxQuwTIHbmlwqKJyWvw0FxoJlXNhcB7~iqdebeyt3sGaqiqqxyHOCu126220zf8E~kheMg7SzAohhgutPUNL7GBt3yZi5c8GsNK7jMDvPKoGnZMiQ5u2pVYEDUvtBY4AgGtfn7~Pi84A__',
                            userName: 'Carlos Mena',
                            actionText: 'Compartió tu publicación',
                            timeAgo: 'Hace 2 hora',
                          ),
                    CardNotification(
                            profileImageUrl:
                                'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
                            userName: 'Carlos Mena',
                            actionText: 'Compartió tu publicación',
                            timeAgo: 'Hace 2 hora',
                          ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class TitleNotification extends StatelessWidget {
  final String label;
  const TitleNotification({
    super.key, required this.label, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            child: Text(label,
                style: TextStyle(
                    fontSize: 25.h, fontWeight: FontWeight.w600)),
            padding: EdgeInsets.only(left: 25.h)),
        Spacer(),
      ],
    );
  }
}
