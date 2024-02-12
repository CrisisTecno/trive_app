import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyChip extends StatefulWidget {
  @override
  _PrivacyChipState createState() => _PrivacyChipState();
}

class _PrivacyChipState extends State<PrivacyChip> {
  String _selectedPrivacy = 'Público'; 

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'public/assets/navbar/arroy_back.svg', 
            width: 20,
            height: 20,
          ),
          SizedBox(width: 8),
          Text(_selectedPrivacy),
          SizedBox(width: 8),
          SvgPicture.asset(
           'public/assets/navbar/arroy_back.svg', 
            width: 16,
            height: 16,
          ),
        ],
      ),
      selected: true,
      onSelected: (bool selected) {
        setState(() {
          if (_selectedPrivacy == 'Público') {
            _selectedPrivacy = 'Amigos';
          } else if (_selectedPrivacy == 'Amigos') {
            _selectedPrivacy = 'Solo yo';
          } else {
            _selectedPrivacy = 'Público';
          }
        });
      },
      backgroundColor: Color(0xffEDF1FF),
    
    );
  }
}
