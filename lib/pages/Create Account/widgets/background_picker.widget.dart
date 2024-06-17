import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UserBackgroundWidget extends StatefulWidget {
  final String? backgroundImageUrl;
  final String? profileImageUrl;

  UserBackgroundWidget({
    Key? key,
    this.backgroundImageUrl,
    this.profileImageUrl,
  }) : super(key: key);

  @override
  _UserBackgroundWidgetState createState() => _UserBackgroundWidgetState();
}

class _UserBackgroundWidgetState extends State<UserBackgroundWidget> {
  ImageProvider? _backgroundImage;

  @override
  void initState() {
    super.initState();
    if (widget.backgroundImageUrl != null) {
      _backgroundImage = NetworkImage(widget.backgroundImageUrl!);
    }
  }

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
        Center(
          child: Container(
            height:
                230.0, // Reemplaza 230.h con 230.0 si no usas un package de tamaño responsivo
            decoration: BoxDecoration(
              color: (widget.backgroundImageUrl != null ||
                      widget.profileImageUrl != null)
                  ? Colors.blue // Cambia el color aquí
                  : Colors.grey, // Color por defecto
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: _backgroundImage != null
                  ? FadeInImage(
                      placeholder: AssetImage('public/assets/loadings/lo3.gif'),
                      image: _backgroundImage!,
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'public/assets/images/background_1.png',
                            fit: BoxFit.cover);
                      },
                    )
                  : Image.asset('public/assets/images/background_1.png',
                      fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom:
              35.0, // Reemplaza 35.h con 35.0 si no usas un package de tamaño responsivo
          right:
              20.0, // Reemplaza 20.h con 20.0 si no usas un package de tamaño responsivo
          child: GestureDetector(
            onTap: _pickImage, // Llama a _pickImage cuando se presiona el botón
            child: Container(
              padding: EdgeInsets.all(
                  8), // Agrega algo de espacio alrededor del icono del lápiz
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
