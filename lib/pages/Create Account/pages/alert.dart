import 'package:flutter/material.dart';

class IncompleteFieldsDialog extends StatelessWidget {
  final String title;
  final String description;

  IncompleteFieldsDialog({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      content: Text(
        description,
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border:
                    Border.all(width: 2, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
