import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/pages/Create%20Account/widgets/my_chips.widgets.dart';
import 'package:trive_bysc/pages/Publish/widgets/chip_publish_privacity_2.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../widgets/widgets.dart';
import '../widgets/app_bar.publish.dart';
import '../widgets/chip_publish_privacity.dart';
import '../widgets/choice_chip.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

final FirebaseStorage storage = FirebaseStorage.instance;

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<String> selectedChips = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<File> selectedImages = [];
  TextEditingController _controller = TextEditingController();

  Future<List<String>> uploadImagesToFirebase(
      List<File> images, String content, List<String> topics) async {
    List<String> downloadUrls = [];
    print("llega aca");
    for (File image in images) {
      //de aca sacamos el texto de las imagenes
      print("Iterando sobre la imagen: ${image.path}");
      final String name = image.path.split('/').last;
      final Reference ref = storage.ref().child('publication').child(name);
      final UploadTask uploadTask = ref.putFile(image);
      print(uploadTask);
      try {
        print("Iniciando la subida de la imagen: ${image.path}");
        TaskSnapshot snapshot = await uploadTask;
        print("La subida de la imagen ${image.path} está completa");
        print("La subida de la imagen ${image.path} está completa");

        String downloadUrl = await snapshot.ref.getDownloadURL();

        downloadUrls.add(downloadUrl);
      } catch (e) {
        print("Error al subir la imagen ${image.path}: $e");
      }
    }

    print("Todas las imágenes se han subido correctamente");
    print(downloadUrls);
    final Timestamp timestamp = Timestamp.now();
    final triveProvider = Provider.of<TriveProvider>(context, listen: false);
    print(triveProvider);
    print(timestamp);
    print(content);
    print(topics);
    DocumentReference docRef = await firestore.collection("Publications").add({
      "createAt": timestamp,
      "content": content,
      "author": triveProvider.userId,
      "images": downloadUrls,
      "likes": [],
      "topics": topics
    });
    print(docRef);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Todo Salio Genial',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            'Se publico sin problemas, continua disfrutando de trive',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteManager.homePage);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 2.w),
                  decoration: BoxDecoration(
                      color: primary,
                      border: Border.all(width: 2, color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    return downloadUrls;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final triveProvider = Provider.of<TriveProvider>(context, listen: false);
    String? nombre = triveProvider.userData?['name'];
    String? ocupation = triveProvider.userData?['occupation'];
    String? imageUrl = triveProvider.userData?['mainImage'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MessagesAppBarPubish(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.h,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(50.h)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'public/assets/loadings/lo3.gif',
                        image: imageUrl!,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              'public/assets/images/background_1.png'); // Ruta de la imagen por defecto
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nombre!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Text(ocupation!,
                          style: TextStyle(
                              color: primary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 5.h,
                      ),
                      ChipOptionPublishPrivacity2(
                        label: 'Publico',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.h),
            //   child: TextField(
            //     decoration: InputDecoration(

            //       hintText: '¿Qué estás pensando?',
            //       border: InputBorder.none,
            //       contentPadding: EdgeInsets.all(16),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller:
                    _controller, // Asigna el TextEditingController al TextField
                decoration: InputDecoration(
                  hintText: '¿Qué estás pensando?',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Selecciona un topic para la publicacion: ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ReusableChips(
                chipLabels: [
                  'Marketing',
                  'Finanzas',
                  'Ventas',
                  'Publicidad',
                  'Liderazgo',
                  'Bienestar'
                ],
                onSelectedLabelsChanged: (selectedLabels) {
                  setState(() {
                    selectedChips.addAll(selectedLabels);
                    selectedChips = selectedChips.toSet().toList();
                  });
                },
              ),
            ),
            Spacer(
              flex: 1,
            ),
            //aca se agregara la imagen
            SelectedImagesIndicator(selectedCount: selectedImages.length),

            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GalleryButton(onImagesSelected: (images) {
                  setState(() {
                    selectedImages = images;
                  });
                }),
                CameraButton(),
                // SvgPicture.asset(
                //   'public/assets/icons/+.svg',
                // ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onClick: () async {
                String textoIngresado = _controller.text;
                if (selectedImages.isNotEmpty &&
                    textoIngresado != '' &&
                    selectedChips != null &&
                    selectedChips != []) {
                  try {
                    print(selectedImages);
                    print(textoIngresado);
                    print(selectedChips);
                    List<String> imageUrls = await uploadImagesToFirebase(
                        selectedImages, textoIngresado, selectedChips);
                    // Aquí puedes guardar las URLs en tu base de datos Firebase
                    print('URLs de imágenes: $imageUrls');
                  } catch (e) {
                    showDialog(
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Error al subir la Publicacion',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: Text(
                            'Ocurrio un error al lanzar la publicacion espera',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50.w, vertical: 2.w),
                                  decoration: BoxDecoration(
                                      color: primary,
                                      border:
                                          Border.all(width: 2, color: primary),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.w))),
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      context: context,
                    );
                  }
                } else {
                  showDialog(
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            'Campos Incompletos',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        content: Text(
                          'Por favor, complete todos los campos topics y imagen.',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50.w, vertical: 2.w),
                                decoration: BoxDecoration(
                                    color: primary,
                                    border:
                                        Border.all(width: 2, color: primary),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.w))),
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    context: context,
                  );
                }
              },
              title: 'Publicar',
              backgroundColor: primary,
              titleColor: Colors.white,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CameraButton extends StatefulWidget {
  @override
  _CameraButtonState createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCamera,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          height: 40.h,
          width: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
              color: primary),
          child: SvgPicture.asset(
            'public/assets/icons/camera_2.svg',
          )),
    );
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }
}

class GalleryButton extends StatefulWidget {
  final Function(List<File>) onImagesSelected;

  const GalleryButton({Key? key, required this.onImagesSelected})
      : super(key: key);

  @override
  _GalleryButtonState createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        _selectedImages =
            pickedImages.map((image) => File(image.path)).toList();
      });
      widget.onImagesSelected(_selectedImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImages,
      child: SvgPicture.asset(
        'public/assets/icons/galery.svg',
      ),
    );
  }
}

class SelectedImagesIndicator extends StatelessWidget {
  final int selectedCount;

  const SelectedImagesIndicator({Key? key, required this.selectedCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: selectedCount > 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Se seleccionaron $selectedCount imágenes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
