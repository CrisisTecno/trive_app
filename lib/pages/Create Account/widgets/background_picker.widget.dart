import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trive_bysc/utils/utils.dart';

class UserBackgroundWidget extends StatefulWidget {
  @override
  _UserBackgroundWidgetState createState() => _UserBackgroundWidgetState();
}

class _UserBackgroundWidgetState extends State<UserBackgroundWidget> {
  ImageProvider? _backgroundImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _backgroundImage = FileImage(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 230.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _backgroundImage ?? AssetImage('public/assets/images/background_1.png'),
              fit: BoxFit.cover, // Asegúrate de que la imagen cubra todo el fondo
            ),
          ),
        ),
        Positioned(
          bottom: 35.h, // Elimina .h si no estás usando la librería 'flutter_screenutil'
          right: 20.h, // Elimina .h si no estás usando la librería 'flutter_screenutil'
          child: GestureDetector(
            onTap: _pickImage, // Llama a _pickImage cuando se presiona el botón
            child: Container(
              padding: EdgeInsets.all(8), // Agrega algo de espacio alrededor del icono del lápiz
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo del botón
                shape: BoxShape.circle, // Forma circular para el botón
              ),
              child: SvgPicture.asset(
                'public/assets/icons/pencil.svg',
                height: 20.0, 
                width: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
