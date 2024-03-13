import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/caendar.widget.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:intl/intl.dart';

class DairyDatePart extends StatefulWidget {
  final Function(DateTime)? onDateSelected;

  const DairyDatePart({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _DairyDatePartState createState() => _DairyDatePartState();
}

class _DairyDatePartState extends State<DairyDatePart> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Escoge una fecha',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20.h,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Container(
              child: CustomCalendar(
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                  if (widget.onDateSelected != null) {
                    widget.onDateSelected!(_selectedDate!);
                  }
                },
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffB6B6B6)),
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          if (_selectedDate != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fecha seleccionada: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.h,
                    ),
                  ),
                  Text(
                    '${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.h,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
