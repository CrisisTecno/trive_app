// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/utils.dart';

// class MyBottomAppBar extends StatefulWidget {
//   @override
//   _MyBottomAppBarState createState() => _MyBottomAppBarState();
// }

// class _MyBottomAppBarState extends State<MyBottomAppBar> {
//   int _selectedIndex = 0; // La variable para rastrear el ítem seleccionado

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       height: 70.h,
//       shape: CircularNotchedRectangle(),
//       notchMargin: 6.0,
//       color: Colors.white,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           _buildTabItem(
//             icon: Icons.home,
//             text: 'Inicio',
//             isSelected: _selectedIndex == 0,
//             index: 0,
//           ),
//           _buildTabItem(
//             icon: Icons.message,
//             text: 'Mensajes',
//             isSelected: _selectedIndex == 1,
//             index: 1,
//           ),
//           SizedBox(width: 48), // Crea un espacio para el FAB
//           _buildTabItem(
//             icon: Icons.calendar_today,
//             text: 'Agenda',
//             isSelected: _selectedIndex == 2,
//             index: 2,
//           ),
//           _buildTabItem(
//             icon: Icons.person,
//             text: 'Perfil',
//             isSelected: _selectedIndex == 3,
//             index: 3,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabItem({
//     required IconData icon,
//     required String text,
//     required bool isSelected,
//     required int index,
//   }) {
//     return InkWell(
//   splashColor: Colors.transparent, // Elimina la animación de la onda
//   highlightColor: Colors.transparent, 
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(
//             icon,
//             color: isSelected ? primary : Colors.grey, // Cambia el color cuando está seleccionado
//           ),
//           Text(
//             text,
//             style: TextStyle(
//               color: isSelected ? primary : Colors.grey, // Cambia el color del texto también si lo deseas
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

// Añade los nuevos parámetros aquí
class MyBottomAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomAppBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70.h,
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildTabItem(
            icon: Icons.home,
            text: 'Inicio',
            isSelected: widget.selectedIndex == 0,
            index: 0,
          ),
          _buildTabItem(
            icon: Icons.message,
            text: 'Mensajes',
            isSelected: widget.selectedIndex == 1,
            index: 1,
          ),
          SizedBox(width: 48), // Espacio para el FAB
          _buildTabItem(
            icon: Icons.calendar_today,
            text: 'Agenda',
            isSelected: widget.selectedIndex == 2,
            index: 2,
          ),
          _buildTabItem(
            icon: Icons.person,
            text: 'Perfil',
            isSelected: widget.selectedIndex == 3,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? primary : Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? primary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
