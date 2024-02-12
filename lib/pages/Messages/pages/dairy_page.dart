import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

import '../widgets/app_bar.chat.widget.dart';
import '../widgets/contac_card.widget.dart';
import './parts/parts.dart';

class DairyPage extends StatefulWidget {
  @override
  _DairyPageState createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {
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

  const DairyPublishButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _DairyPublishButtonState createState() => _DairyPublishButtonState();
}

class _DairyPublishButtonState extends State<DairyPublishButton> {
  late PageController _pageController;
  int _selectedPageIndex = 0;
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

  void _handlePublish() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: ContactCard(
            profileImageUrl:
                'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
            svgIconUrl: 'https://url_to_the_svg_icon',
          ),
        );
      },
    );
    print('Publicar');
  }

  void _onNavigationButtonTapped(int pageIndex) {
   
    _selectedPageIndex=pageIndex;
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
      height: widget.height,
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
                DairyDatePart(),
                DairyHourPart(),
                DairyTimePartSelect(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}










                          //menu desplegable
                          // DropdownButton<String>(
                          //   value: dropdownValue,
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue!;
                          //     });
                          //   },
                          //   items: <String>['Público', 'Privado', 'Oculto']
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
              // DropdownButton<String>(
              //   value: onlineStatus,
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       onlineStatus = newValue!;
              //     });
              //   },
              //   items: <String>['Online', 'Presencial', 'Híbrido']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              // SizedBox(height: 8),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'https://meet.google.com/cvq-qrii-rus',
              //     suffixIcon: Icon(Icons.link),
              //   ),
              // ),