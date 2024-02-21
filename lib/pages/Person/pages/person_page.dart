import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

import './parts/parts.dart';

class PersonPageState extends StatefulWidget {
  @override
  _PersonPageStateState createState() => _PersonPageStateState();
}

class _PersonPageStateState extends State<PersonPageState> {
  String dropdownValue = 'Público';
  String onlineStatus = 'Online';
  final GlobalKey<_DairyPublishButtonState> _dairyPublishButtonKey =
      GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DairyPublishButton(
            key: _dairyPublishButtonKey,
            width: 1000.w,
          ),
        ],
      ),
    );
  }
}

class DairyPublishButton extends StatefulWidget {
  final double width;

  const DairyPublishButton({
    Key? key,
    required this.width,
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
    //         profileImageUrl:
    //             'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
    //         svgIconUrl: 'https://url_to_the_svg_icon',
    //       ),
    //     );
    //   },
    // );
    // print('Publicar');
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
      height: 600.h,
      width: widget.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navigationButton('Publicaciones', 0),
              _navigationButton('Chat grupal', 1),
              _navigationButton('Foro', 2),
              _navigationButton('Eventos', 3),
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
                PublishPartSelect(),
                ChatPartSelect(),
                FotoPartSelect(),
                EventsPartSelect(),
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