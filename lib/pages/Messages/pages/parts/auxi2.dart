import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:intl/intl.dart';
import '../../../Publish/widgets/time_chip.dart';
import '../../../pages.dart';

class DairyTimePartSelect extends StatefulWidget {
  final DateTime? selectedDate;
  final String? selectedTime;
  final Function(String)? onPurposeSelected;

  const DairyTimePartSelect({
    Key? key,
    this.selectedDate,
    this.selectedTime,
    this.onPurposeSelected,
  }) : super(key: key);

  @override
  State<DairyTimePartSelect> createState() => _DairyTimePartSelectState();
}

class _DairyTimePartSelectState extends State<DairyTimePartSelect> {
  String selectedPrice = '';
  String? purpose = '';

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
                Text('Escoge una fecha',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.h)),
                Text(
                    widget.selectedDate != null
                        ? DateFormat('EEEE, d MMMM yyyy')
                            .format(widget.selectedDate!)
                        : 'Seleccione una fecha',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.h)),
                Text(
                    widget.selectedTime != null
                        ? widget.selectedTime!
                        : 'Seleccione una hora',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.h)),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Propósito de la junta',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.h)),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: TextEditingController(text: purpose),
                  hintText: 'Ingrese el propósito de la junta',
                  onChanged: (value) {
                    setState(() {
                      purpose = value;
                    });
                    if (widget.onPurposeSelected != null) {
                      widget.onPurposeSelected!(value);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.hintText = 'Aprender Programacion avanzada',
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }
}
