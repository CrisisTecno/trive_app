import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';

class MessageTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String id;
  final String messagePreview;
  final String date;
  final Map<String, dynamic> personData;
  final int messageCount;

  const MessageTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.messagePreview,
    required this.date,
    required this.messageCount,
    required this.id,
    required this.personData,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<TriveProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        userProvider.setPersonData(widget.id);
        userProvider.setPersonComplete(widget.personData);

        Navigator.of(context).pushNamed(RouteManager.chat);
      },
      child: Column(
        children: [
          Divider(height: 1, color: Colors.black.withOpacity(0.1)),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'public/assets/loadings/lo3.gif',
                  image: widget.imageUrl,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'public/assets/images/background_1.png',
                      width: 100.h,
                      height: 100.h,
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              widget.name,
              style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(widget.messagePreview),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                _messageCountBubble(widget.messageCount),
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
