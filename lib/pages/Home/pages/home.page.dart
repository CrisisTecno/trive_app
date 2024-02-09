import 'package:flutter/material.dart';
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

  final List<Widget> _screens = [
    Home(),
    Messages(),
    Diary(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens.elementAt(_selectedIndex), 
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white, size: 35.h),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: MyBottomAppBar(
              selectedIndex: _selectedIndex, 
              onItemTapped: _onItemTapped,
      ), // Añade callback para selección
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}




