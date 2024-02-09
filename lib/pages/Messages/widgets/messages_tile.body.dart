import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

class MessageTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String messagePreview;
  final String date;
  final int messageCount;

  const MessageTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.messagePreview,
    required this.date,
    required this.messageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
           Navigator.of(context)
                                  .pushNamed(RouteManager.chat);
      },
      child: Column(
        children: [
          Divider(height: 1, color: Colors.black.withOpacity(0.1)),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(messagePreview),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                _messageCountBubble(messageCount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageCountBubble(int count) {
    return Container(
      width: 25.h,
      height: 25.h,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(100),
      ),
    
      child: Text(
        count.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.h,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
