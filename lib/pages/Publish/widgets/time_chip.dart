import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

class TimeChip extends StatefulWidget {
  final String label;

  const TimeChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _TimeChipState createState() => _TimeChipState();
}

class _TimeChipState extends State<TimeChip> {
  bool isSelected = false;

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelected,
      child: Container(
        width: 1000.w,
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? primary.withOpacity(0.1) : Colors.transparent, 
          borderRadius: BorderRadius.circular(12.h), 
          border:  isSelected ?Border.all( color: primary, width: 1.0):Border.all( color: Colors.black.withOpacity(0.1), width: 1.0), 
          
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              color: primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
