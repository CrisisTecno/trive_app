import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import 'pages.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  DiaryState createState() => DiaryState();
}

class DiaryState extends State<Diary> {
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

  void _onNavigationButtonTapped(int pageIndex) {
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
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SizedBox(
      height: screensize.height * 0.9,
      width: 1000.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: CustomAppBar(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navigationButton('Calendario', 0),
              _navigationButton('Solicitudes', 1),
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
                CalendarPart(),
                SolicitudPart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
