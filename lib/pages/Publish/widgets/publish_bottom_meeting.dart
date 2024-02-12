import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Publish/widgets/date.part.dart';
import 'package:trive_bysc/pages/Publish/widgets/time.part.dart';
import 'package:trive_bysc/utils/utils.dart';

import 'hour.part.dart';

class PublishButton extends StatefulWidget {
  final double width;
  final double height;

  const PublishButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _PublishButtonState createState() => _PublishButtonState();
}

class _PublishButtonState extends State<PublishButton> {
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
      duration: Duration(milliseconds:100),
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
              _navigationButton('Tiempo', 2), // Cambiado a Publicar
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
                DatePart(), 
                HourPart(), 
                TimePartSelect(), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
