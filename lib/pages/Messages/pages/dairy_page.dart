import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

import '../widgets/app_bar.chat.widget.dart';
import '../widgets/contac_card.widget.dart';
import './parts/parts.dart';

class DairyPage extends StatefulWidget {
  @override
  _DairyPageState createState() => _DairyPageState();
}

//aca pantallas para agendar la llamada
class _DairyPageState extends State<DairyPage> {
  DateTime? selectedDate;

  String dropdownValue = 'Público';
  String onlineStatus = 'Online';

  final GlobalKey<_DairyPublishButtonState> _dairyPublishButtonKey =
      GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomButton(
          onClick: () {
            final currentState = _dairyPublishButtonKey.currentState;
            currentState?._handleOnPressed();
          },
          title: _dairyPublishButtonKey.currentState?._selectedPageIndex == 2
              ? 'Publicar'
              : 'Continuar',
          backgroundColor: primary,
          titleColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessagesAppBar(),
              DairyPublishButton(
                key: _dairyPublishButtonKey,
                height: 550.h,
                width: 1000.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DairyPublishButton extends StatefulWidget {
  final double width;
  final double height;
  final Function(DateTime)? onDateSelected;
  final Function(String)? onTimeSelected;
  final Function(String)? onPurposeSelected;
  const DairyPublishButton({
    Key? key,
    required this.width,
    required this.height,
    this.onDateSelected,
    this.onTimeSelected,
    this.onPurposeSelected,
  }) : super(key: key);

  @override
  _DairyPublishButtonState createState() => _DairyPublishButtonState();
}

class _DairyPublishButtonState extends State<DairyPublishButton> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late PageController _pageController;
  int _selectedPageIndex = 0;
  DateTime? _selectedDate;
  String? _selectedTime;
  String? purpose;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> onPost() async {
    try {
      if (_selectedDate != null && _selectedTime != null) {
        print("estamos por aca");
        final triveProvider =
            Provider.of<TriveProvider>(context, listen: false);
        final Timestamp now = Timestamp.now();
        print(triveProvider.personId);

        DocumentReference docRef = await firestore.collection("Calls").add({
          "date": _selectedDate,
          "hour": _selectedTime,
          "createAt": now,
          "purpose": "xaxaxa",
          "client": triveProvider.userId,
          "expert": triveProvider.personId,
          "status": "FOR_CONFIRMATION",
        });

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Todo Salio Genial',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              content: Text(
                'Se a agendado correctamente, disfruta de trive',
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.w))),
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
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Tenemos un Problemilla',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              content: Text(
                'No se pudo agendar la cita verifica que todos los campos hayan sido ingresados',
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.w))),
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
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add user: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _handleOnPressed() {
    print(_selectedPageIndex);
    if (_selectedPageIndex < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      _handlePublish();
    }
  }

  void _handlePublish() async {
    print(_selectedDate);
    print(_selectedTime);
    print(purpose);
    if (_selectedDate == null || _selectedTime == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error al Intenar Agendar la reunion'),
            content: Text('Pruebe en seleccionar nuevamente la fecha y hora'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      onPost();
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return Dialog(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       elevation: 0,
      //       backgroundColor: Colors.transparent,
      //       child: ContactCard(
      //         onChanged: onPost,
      //         profileImageUrl: cardConection,
      //         svgIconUrl: 'https://url_to_the_svg_icon',
      //       ),
      //     );
      //   },
      // );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to upload post: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _onNavigationButtonTapped(int pageIndex) {
    _selectedPageIndex = pageIndex;
    print(_selectedPageIndex);
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _navigationButton(String title, int pageIndex) {
    return GestureDetector(
      onTap: () => _onNavigationButtonTapped(pageIndex),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: _selectedPageIndex == pageIndex
            ? BoxDecoration(
                border: Border(bottom: BorderSide(width: 2.0, color: primary)),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            color: _selectedPageIndex == pageIndex ? primary : Colors.grey,
            fontSize: 17.h,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      width: widget.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navigationButton('Fecha', 0),
              _navigationButton('Hora', 1),
              _navigationButton('Tiempo', 2),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedPageIndex = index;
                });
              },
              children: [
                DairyDatePart(
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                    if (widget.onDateSelected != null) {
                      widget.onDateSelected!(_selectedDate!);
                    }
                  },
                ),
                DairyHourPart(
                  onTimeSelected: (time) {
                    setState(() {
                      _selectedTime = time;
                    });
                    if (widget.onTimeSelected != null) {
                      widget.onTimeSelected!(_selectedTime!);
                    }
                  },
                ),
                DairyTimePartSelect(
                  selectedDate: _selectedDate,
                  selectedTime: _selectedTime,
                  onPurposeSelected: (purpose) {
                    if (widget.onPurposeSelected != null) {
                      widget.onPurposeSelected!(purpose);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
