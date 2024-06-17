import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileWidget extends StatefulWidget {
  final String? backgroundImageUrl;
  final String? profileImageUrl;

  const UserProfileWidget(
      {super.key, this.backgroundImageUrl, this.profileImageUrl});

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  ImageProvider? _profileImage;

  @override
  void initState() {
    super.initState();
    if (widget.profileImageUrl != null) {
      _profileImage = NetworkImage(widget.profileImageUrl!);
    }
  }

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
          padding: EdgeInsets.all(
              3.0), // Ajusta el valor si necesitas un tamaño específico
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(top: 16.0),
          child: CircleAvatar(
            radius: 70.0, // Ajusta el valor si necesitas un tamaño específico
            backgroundColor: Colors.white,
            child: ClipOval(
              child: _profileImage != null
                  ? FadeInImage(
                      placeholder: AssetImage('public/assets/loadings/lo3.gif'),
                      image: _profileImage!,
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'public/assets/images/background_1.png',
                            fit: BoxFit.cover);
                      },
                    )
                  : Image.asset(
                      'public/assets/images/background_1.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              margin: EdgeInsets.only(top: 16.0),
              child: CircleAvatar(
                radius:
                    20.0, // Ajusta el valor si necesitas un tamaño específico
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
