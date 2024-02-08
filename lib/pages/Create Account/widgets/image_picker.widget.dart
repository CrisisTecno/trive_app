import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trive_bysc/utils/utils.dart';

class UserProfileWidget extends StatefulWidget {
  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  ImageProvider? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = FileImage(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3.h),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(top: 16),
          child: CircleAvatar(
            radius: 70.h,
            backgroundImage: _profileImage ??
                AssetImage('public/assets/images/profile_1.png'),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              margin: EdgeInsets.only(top: 16),
              child: CircleAvatar(
                radius: 20.h,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'public/assets/icons/camera.svg',
                  height: 20.0,
                  width: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
