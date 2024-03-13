import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../../../Publish/widgets/time_chip.dart';

class DairyHourPart extends StatefulWidget {
  final Function(String selectedTime)?
      onTimeSelected; // Función de devolución de llamada para pasar el tiempo seleccionado

  const DairyHourPart({
    Key? key,
    this.onTimeSelected,
  }) : super(key: key);

  @override
  _DairyHourPartState createState() => _DairyHourPartState();
}

class _DairyHourPartState extends State<DairyHourPart> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Escoge una hora',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.h,
                  ),
                ),
                if (selectedTime != null)
                  Text(
                    selectedTime!,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.h,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          TimeChip(
            label: '09:00 AM',
            onTap: (isSelected) {
              setState(() {
                selectedTime = isSelected ? '09:00 AM' : null;
              });
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(selectedTime ?? '');
              }
            },
          ),
          TimeChip(
            label: '10:00 AM',
            onTap: (isSelected) {
              setState(() {
                selectedTime = isSelected ? '10:00 AM' : null;
              });
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(selectedTime ?? '');
              }
            },
          ),
          TimeChip(
            label: '11:00 AM',
            onTap: (isSelected) {
              setState(() {
                selectedTime = isSelected ? '11:00 AM' : null;
              });
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(selectedTime ?? '');
              }
            },
          ),
          TimeChip(
            label: '12:00 PM',
            onTap: (isSelected) {
              setState(() {
                selectedTime = isSelected ? '12:00 PM' : null;
              });
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(selectedTime ?? '');
              }
            },
          ),
        ],
      ),
    );
  }
}
