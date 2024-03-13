import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class UserModel {
  String? name;
  String? lastName;
  String? email;
  List? blockedUsers;
  String? phone;
  String? notificationToken;
  List? following;
  String? contactEmail;
  String? ip;
  String? countryName;
  bool? messages;
  bool? premium;
  bool? call;
  bool? videoCall;
  double? messagesPrice;
  double? callPrice;
  double? videoCallPrice;
  String? organization;
  String? password;
  Map? callTimes;
  String? wallpaper;
  String? city;
  DateTime? created;
  String? countryCode;
  String? provider;
  String? stripeID;
  String? ocupation;
  DateTime? bd;
  String? degree;
  String? university;
  List? topics;
  List? friends;
  List? connectedUsers;
  List? pendingFriends;
  DateTime? lastlogin;
  String? uid;
  String? type;
  bool? complete;
  String? image;
  double? points;
  double? connectPrice;
  String? about;
  String? especialization;
  List? suscribedTopics;
  List? followers;
  Position? position;

  UserModel(
      {this.created,
      this.university,
      this.email,
      this.followers,
      this.messages,
      this.position,
      this.callTimes,
      this.call,
      this.suscribedTopics,
      this.connectedUsers,
      this.videoCall,
      this.messagesPrice,
      this.callPrice,
      this.videoCallPrice,
      this.complete,
      this.connectPrice,
      this.provider,
      this.password,
      this.wallpaper,
      this.stripeID,
      this.friends,
      this.pendingFriends,
      this.organization,
      this.about,
      this.ocupation,
      this.city,
      this.countryCode,
      this.uid,
      this.lastlogin,
      this.ip,
      this.premium,
      this.image,
      this.degree,
      this.topics,
      this.blockedUsers,
      this.countryName,
      this.bd,
      this.contactEmail,
      this.following,
      this.lastName,
      this.type,
      this.name,
      this.points,
      this.especialization,
      this.notificationToken,
      this.phone});

  UserModel.fromMap(Map<String, dynamic> data, id)
      : this(
            friends: data['friends'] ?? [],
            points: data['points'] ?? 0,
            connectedUsers: data['connectedUsers'] ?? [],
            pendingFriends: data['pendingFriends'] ?? [],
            wallpaper: data['wallpaper'],
            created: data['created'] == null
                ? DateTime.now()
                : data['created'].toDate(),
            university: data['university'],
            suscribedTopics: data['suscribedTopics'] ?? [],
            contactEmail: data['contactEmail'] ?? data['email'],
            stripeID: data['stripeID'],
            organization: data['organization'],
            password: data['password'] ?? '',
            provider: data['provider'] ?? 'Email',
            blockedUsers: data['blockedUsers'] ?? [],
            complete: data['complete'] ?? false,
            position: data['position'] == null
                ? null
                : Position(
                    longitude: data['position'].longitude,
                    latitude: data['position'].latitude,
                    timestamp: DateTime.now(),
                    accuracy: 1,
                    altitude: 1,
                    altitudeAccuracy: 1,
                    heading: 1,
                    headingAccuracy: 1,
                    speed: 1,
                    speedAccuracy: 1),
            following: data['following'] ?? [],
            followers: data['followers'] ?? [],
            connectPrice: data['connectPrice'] ?? 0,
            city: data['city'],
            callTimes: data['callTimes'] ?? {},
            type: 'user',
            call: data['call'] ?? false,
            videoCall: data['videoCall'] ?? false,
            messages: data['messages'] ?? false,
            messagesPrice: data['messagesPrice'] ?? 0,
            callPrice: data['callPrices'] == null
                ? 0.0
                : data['callPrices'].toDouble(),
            videoCallPrice: data['videoCallPrice'],
            especialization: data['especialization'],
            ocupation: data['ocupation'] ?? '',
            about: data['about'] ?? '',
            degree: data['degree'],
            countryName: data['countryName'] ?? ' ',
            email: data['email'],
            bd: data['bd'] == null ? null : data['bd'].toDate(),
            countryCode: data['countryCode'] ?? '',
            uid: id,
            topics: data['topics'] ?? [],
            lastlogin: data['lastlogin'] == null
                ? DateTime.now()
                : data['lastlogin'].toDate(),
            lastName: data['lastName'],
            name: data['name'],
            ip: data['ip'],
            premium: data['premium'] ?? false,
            image: data['image'] ??
                'https://th.bing.com/th/id/OIP.cxcqa9RvhGnRd8x3N2oBdgHaHn?pid=ImgDet&rs=1',
            notificationToken: data['notificationToken'],
            phone: data['phone']);

  String getFullName() {
    return name! + ' ' + lastName!;
  }

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> userD =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    return UserModel.fromMap(userD.data()!, userD.id);
  }

  Map<String, dynamic> toJson() {
    return {
      'created': created,
      'suscribedTopics': suscribedTopics ?? [],
      'university': university,
      'following': following,
      'followers': followers,
      'organization': organization,
      'city': city,
      'callTimes': callTimes,
      'stripeID': stripeID,
      'connectedUsers': connectedUsers ?? [],
      'ocupation': ocupation,
      'wallpaper': wallpaper,
      'premium': premium ?? false,
      "especialization": especialization,
      'about': about,
      'degree': degree,
      'connectPrice': connectPrice,
      'countryName': countryName,
      'position': position == null
          ? null
          : GeoPoint(position!.latitude, position!.longitude),
      'email': email,
      'bd': bd,
      'countryCode': countryCode,
      'topics': topics,
      'lastlogin': lastlogin,
      'lastName': lastName,
      'name': name,
      'ip': ip,
      'image': image,
      'complete': complete,
      'videoCall': videoCall,
      'call': call,
      'videoCallPrice': videoCallPrice,
      'callPrice': callPrice,
      'messages': messages,
      'messagesPrice': messagesPrice,
      'notificationToken': notificationToken,
      'phone': phone
    };
  }

  Map callTimesDummyData() {
    return {
      1: {
        '12:00': true,
        '12:30': true,
        '13:00': true,
        '13:30': true,
        '14:00': true,
        '14:30': true,
        '15:00': true,
        '15:30': true,
        '16:00': true,
        '16:30': true,
        '17:00': true,
        '17:30': true,
        '18:00': true,
      },
      2: {
        '12:00': true,
        '12:30': true,
        '13:00': true,
        '13:30': true,
        '14:00': true,
        '14:30': true,
        '15:00': true,
        '15:30': true,
        '16:00': true,
        '16:30': true,
        '17:00': true,
        '17:30': true,
        '18:00': true,
      },
      3: {
        '12:00': true,
        '12:30': true,
        '13:00': true,
        '13:30': true,
        '14:00': true,
        '14:30': true,
        '15:00': true,
        '15:30': true,
        '16:00': true,
        '16:30': true,
        '17:00': true,
        '17:30': true,
        '18:00': true,
      },
      4: {
        '12:00': true,
        '12:30': true,
        '13:00': true,
        '13:30': true,
        '14:00': true,
        '14:30': true,
        '15:00': true,
        '15:30': true,
        '16:00': true,
        '16:30': true,
        '17:00': true,
        '17:30': true,
        '18:00': true,
      },
      5: {
        '12:00': true,
        '12:30': true,
        '13:00': true,
        '13:30': true,
        '14:00': true,
        '14:30': true,
        '15:00': true,
        '15:30': true,
        '16:00': true,
        '16:30': true,
        '17:00': true,
        '17:30': true,
        '18:00': true,
      },
      6: {
        '12:00': true,
      },
    };
  }
}

class ExperienceModel {
  String? place;
  String? ocupation;
  DateTime? start;
  DateTime? end;
  ExperienceModel({
    this.end,
    this.place,
    this.ocupation,
    this.start,
  });

  ExperienceModel.fromMap(Map<String, dynamic> data)
      : this(
          end: data['end'].toDate(),
          start: data['start'].toDate(),
          ocupation: data['ocupation'],
          place: data['place'],
        );

  Map<String, dynamic> toJson() {
    return {
      'end': end,
      'start': start,
      'ocupation': ocupation,
      'place': place,
    };
  }
}

class NotificationModel {
  String? content;
  String? user;
  String? postID;
  String? type;
  DateTime? date;

  NotificationModel(
      {this.content, this.date, this.postID, this.type, this.user});

  NotificationModel.fromMap(Map<String, dynamic> data)
      : this(
          content: data['content'],
          user: data['user'],
          postID: data['postID'],
          type: data['type'],
          date: data['date'].toDate(),
        );
}
