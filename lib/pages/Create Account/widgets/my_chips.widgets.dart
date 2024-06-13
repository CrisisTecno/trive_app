// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/theme/colors/colors.dart';

// class ReusableChips extends StatefulWidget {
//   final List<String> chipLabels;
//   final Function(int, bool) onSelectionChanged;

//   const ReusableChips({
//     Key? key,
//     required this.chipLabels,
//     required this.onSelectionChanged,
//   }) : super(key: key);

//   @override
//   _ReusableChipsState createState() => _ReusableChipsState();
// }

// class _ReusableChipsState extends State<ReusableChips> {
//   List<bool> _selected;

//   _ReusableChipsState() : _selected = [];

//   @override
//   void initState() {
//     super.initState();
//     _selected = List<bool>.filled(widget.chipLabels.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 10,
//       runSpacing: 6,
//       children: List<Widget>.generate(
//         widget.chipLabels.length,
//         (int index) {
//           return ChoiceChip(
//             label: Text(
//               widget.chipLabels[index],
//               style: TextStyle(
//                 color: _selected[index] ? Colors.white : Colors.black,
//               ),
//             ),
//             selected: _selected[index],
//             onSelected: (bool selected) {
//               setState(() {
//                 _selected[index] = selected;
//                 widget.onSelectionChanged(index, selected);
//               });
//             },
//             backgroundColor: Colors.white,
//             selectedColor: primary,
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/Size/sizer.dart';
// import 'package:trive_bysc/utils/theme/colors/colors.dart'; // Asumiendo que 'primary' está definido aquí.

// class ReusableChips extends StatefulWidget {
//   final List<String> chipLabels;
//   final Function(int, bool) onSelectionChanged;

//   const ReusableChips({
//     Key? key,
//     required this.chipLabels,
//     required this.onSelectionChanged,
//   }) : super(key: key);

//   @override
//   _ReusableChipsState createState() => _ReusableChipsState();
// }

// class _ReusableChipsState extends State<ReusableChips> {
//   List<bool> _selected;

//   _ReusableChipsState() : _selected = [];

//   @override
//   void initState() {
//     super.initState();
//     _selected = List<bool>.filled(widget.chipLabels.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: List<Widget>.generate(
//         widget.chipLabels.length,
//         (int index) {
//           return Padding(
//             padding: EdgeInsets.only(left: 10.h),
//             child: FilterChip(
//               label: Text(
//                 widget.chipLabels[index],
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: _selected[index] ? primary : Colors.black,
//                 ),
//               ),
//               selected: _selected[index],
//               onSelected: (bool selected) {
//                 setState(() {
//                   _selected[index] = selected;
//                   widget.onSelectionChanged(index, selected);
//                 });
//               },
//               backgroundColor: Color(0xffF6F6F6),
//               selectedColor: primary.withOpacity(0.1),
//               showCheckmark: false,
//               side: BorderSide(
//                   color: _selected[index] ? primary : Colors.transparent),
//               padding: EdgeInsets.symmetric(vertical: 4.0),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart'; // Asumiendo que 'primary' está definido aquí.

class ReusableChips extends StatefulWidget {
  final List<String> chipLabels;
  final Function(List<String>) onSelectedLabelsChanged;

  const ReusableChips({
    Key? key,
    required this.chipLabels,
    required this.onSelectedLabelsChanged,
  }) : super(key: key);

  @override
  _ReusableChipsState createState() => _ReusableChipsState();
}

class _ReusableChipsState extends State<ReusableChips> {
  List<String> selectedLabels = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        widget.chipLabels.length,
        (int index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: FilterChip(
              label: Text(
                widget.chipLabels[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selectedLabels.contains(widget.chipLabels[index])
                      ? primary
                      : Colors.black,
                ),
              ),
              selected: selectedLabels.contains(widget.chipLabels[index]),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedLabels.add(widget.chipLabels[index]);
                  } else {
                    selectedLabels.remove(widget.chipLabels[index]);
                  }
                  widget.onSelectedLabelsChanged(selectedLabels);
                });
              },
              backgroundColor: Color.fromARGB(255, 247, 244, 244),
              selectedColor: primary.withOpacity(0.1),
              showCheckmark: false,
              side: BorderSide(
                  color: selectedLabels.contains(widget.chipLabels[index])
                      ? primary
                      : Colors.transparent),
              padding: EdgeInsets.symmetric(vertical: 4.0),
            ),
          );
        },
      ),
    );
  }
}
