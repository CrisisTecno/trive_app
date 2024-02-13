// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/utils.dart';

// import '../../../widgets/widgets.dart';
// import '../../pages.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     Home(),
//     Messages(),
//     Diary(),
//     Profile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: _screens.elementAt(_selectedIndex),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: primary,
//           shape: CircleBorder(),
//           child: Icon(Icons.add, color: Colors.white, size: 35.h),
//           onPressed: () {},
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: MyBottomAppBar(
//               selectedIndex: _selectedIndex,
//               onItemTapped: _onItemTapped,
//       ), // Añade callback para selección
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }

// Asegúrate de que tus importaciones estén correctas

// void showOverlay(BuildContext context) {
//   overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       bottom: 59,
//       left: 0,
//       right: 0,
//       child: Material(
//         type: MaterialType.transparency,
//         child: Container(
//           color: Colors.white,
//           width: 1000.w,
//           height: 180.h,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               _buildOptionButton('public/assets/icons/facebook.svg', 'Publicación', () {}),
//               _buildOptionButton('public/assets/icons/facebook.svg', 'Publicación', () {}),
//               _buildOptionButton('public/assets/icons/facebook.svg', 'Publicación', () {}),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
//   Overlay.of(context).insert(overlayEntry!);
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isFabVisible = true;

  OverlayEntry? overlayEntry;
  final List<Widget> _screens = [
    Home(),
    Messages(),
    Diary(),
    Profile(),
  ];

  void showOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.2),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20.h),
                height: 150.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildOptionButton(
                            'public/assets/icons/publication.svg',
                            'Publicación', () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.post_screen);
                        }),
                        _buildOptionButton(
                            'public/assets/icons/coruse.svg', 'Curso', () {}),
                        _buildOptionButton(
                            'public/assets/icons/meeting.svg', 'Meeting', () {
                          Navigator.of(context).pushNamed(RouteManager.meeting);
                        }),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),

        // floatingActionButton: Container(
        //   color: Colors.white,
        //   width: double.infinity,
        //   child: Row(
        //     children: [
        //       Spacer(
        //         flex: 1,
        //       ),
        //       FloatingActionButton(
        //         heroTag: 1,
        //         elevation: 0.0,
        //         backgroundColor: primary,
        //         shape: CircleBorder(),
        //         child:
        //             Icon(Icons.close_rounded, color: Colors.white, size: 35.h),
        //         onPressed: () {
        //           hideOverlay();
        //         },
        //       ),
        //       Spacer(
        //         flex: 1,
        //       ),
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          heroTag: 1,
          elevation: 0.0,
          backgroundColor: primary,
          shape: CircleBorder(),
          child: Icon(Icons.close_rounded, color: Colors.white, size: 35.h),
          onPressed: () {
            hideOverlay();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomAppBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _NoneTapped,
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
    setState(() {
      isFabVisible = false;
    });
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    setState(() {
      isFabVisible = true;
    });
  }

  Widget _buildOptionButton(String svgPath, String title, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          hideOverlay();
          onTap();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.h),
              // padding: EdgeInsets.only(left: 15.h,right: 15.h,top: 5.h),

              decoration: BoxDecoration(
                  color: Color(0xffF8F9FF).withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffD9D9D9), width: 2.h)),
              child: SvgPicture.asset(
                svgPath,
                width: 30.h,
                height: 30.h,
              ),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens.elementAt(_selectedIndex),
        floatingActionButton: isFabVisible
            ? FloatingActionButton(
                heroTag: 1,
                backgroundColor: primary,
                shape: CircleBorder(),
                child: Icon(Icons.add, color: Colors.white, size: 35.h),
                onPressed: () {
                  if (overlayEntry == null) {
                    showOverlay(context);
                  } else {
                    hideOverlay();
                  }
                },
                elevation: 0.0,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: isFabVisible
            ? MyBottomAppBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              )
            : null,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _NoneTapped(int index) {}
}
