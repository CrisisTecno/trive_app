// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/Size/sizer.dart';
// import 'package:trive_bysc/utils/theme/colors/colors.dart'; // Asumiendo que 'primary' está definido aquí.

// class ReusableChipsRow extends StatefulWidget {
//   final List<String> chipLabels;
//   final Function(int, bool) onSelectionChanged;

//   const ReusableChipsRow({
//     Key? key,
//     required this.chipLabels,
//     required this.onSelectionChanged,
//   }) : super(key: key);

//   @override
//   _ReusableChipsRowState createState() => _ReusableChipsRowState();
// }

// class _ReusableChipsRowState extends State<ReusableChipsRow> {
//   List<bool> _selected;

//   _ReusableChipsRowState() : _selected = [];

//   @override
//   void initState() {
//     super.initState();
//     _selected = List<bool>.filled(widget.chipLabels.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List<Widget>.generate(
//           widget.chipLabels.length,
//           (int index) {
//             return Container(
//               margin: EdgeInsets.only(left: 10.h),
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     color: _selected[index] ? primary : Colors.black,
//                   ),
//                   borderRadius: BorderRadius.all(Radius.circular(17.h))),
//               child: ChoiceChip(
//                 label: Text(
//                   textAlign: TextAlign.center,
//                   widget.chipLabels[index],
//                   style: TextStyle(
//                     color: _selected[index] ? primary : Colors.black,
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 4.0),
//                 selected: _selected[index],
//                 onSelected: (bool selected) {
//                   setState(() {
//                     _selected[index] = selected;
//                     widget.onSelectionChanged(index, selected);
//                   });
//                 },
//                 backgroundColor: Colors.white,
//                 selectedColor: primary.withOpacity(0.05),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart'; // Asumiendo que 'primary' está definido aquí.

class ReusableChipsRow extends StatefulWidget {
  final List<String> chipLabels;
  final Function(int, bool) onSelectionChanged;

  const ReusableChipsRow({
    Key? key,
    required this.chipLabels,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _ReusableChipsRowState createState() => _ReusableChipsRowState();
}

class _ReusableChipsRowState extends State<ReusableChipsRow> {
  List<bool> _selected;

  _ReusableChipsRowState() : _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.filled(widget.chipLabels.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
                    color: _selected[index] ? primary : Colors.black,
                  ),
                ),
                selected: _selected[index],
                onSelected: (bool selected) {
                  setState(() {
                    _selected[index] = selected;
                    widget.onSelectionChanged(index, selected);
                  });
                },
                backgroundColor: _selected[index]
                    ? Color(0xffEDF1FF)
                    : const Color(0xffF6F6F6),
                selectedColor: primary.withOpacity(0.1),
                showCheckmark: false,
                side: BorderSide(
                    color: _selected[index] ? primary : Colors.transparent),
                padding: EdgeInsets.symmetric(vertical: 4.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
