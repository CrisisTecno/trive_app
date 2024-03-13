class MessageModel {
  String? id;
  String? message;
  String? sender;
  DateTime? date;
  String? type;
  String? link;
  String? file;
  List? image;
  String? title;
  String? thumbnail;
  String? description;
  String? userImage;
  String? userName;
  String? rMessageId;
  String? rMessageContent;
  String? rMessageSenderName;

  MessageModel({
    this.id,
    this.message,
    this.sender,
    this.date,
    this.type,
    this.image,
    this.link,
    this.file,
    this.title,
    this.thumbnail,
    this.description,
    this.userImage,
    this.userName,
    this.rMessageContent,
    this.rMessageId,
    this.rMessageSenderName,
  });

  MessageModel.fromMap(Map<String, dynamic> data, id)
      : this(
            id: id,
            message: data['message'],
            rMessageContent: data['rMessageContent'],
            rMessageSenderName: data['rMessageSenderName'],
            rMessageId: data['rMessageId'],
            userImage: data['userImage'],
            userName: data['userName'],
            sender: data['sender'],
            date: data['date'].toDate(),
            type: data['type'],
            image: data['image'],
            link: data['link'],
            file: data['file'],
            title: data['title'],
            thumbnail: data['thumbnail'],
            description: data['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'userName': userName,
        'userImage': userImage,
        'sender': sender,
        'rMessageContent': rMessageContent,
        'rMessageSenderName': rMessageSenderName,
        'rMessageId': rMessageId,
        'date': date,
        'type': type,
        'link': link,
        'file': file,
        'title': title,
        'thumbnail': thumbnail,
        'image': image,
        'description': description,
      };
}
