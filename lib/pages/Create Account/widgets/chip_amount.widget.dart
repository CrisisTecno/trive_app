import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';
import 'package:trive_bysc/utils/utils.dart';


class AmountChip extends StatefulWidget {
  final String amount;
  final String currency;

  const AmountChip({
    Key? key,
    required this.amount,
    required this.currency,
  }) : super(key: key);

  @override
  _AmountChipState createState() => _AmountChipState();
}

class _AmountChipState extends State<AmountChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xffEDF1FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: _isSelected ? Border.all(color: primary, width: 2.0) :  Border.all(color: Colors.black.withOpacity(0.1), width: 2.0),
      
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
            'public/assets/icons/thunder.svg',
            height: 40.h,
            width: 40.h,
          ),
                SizedBox(width: 8.0),
                Text(
                  '${widget.amount}',
                  style: TextStyle(
                    fontSize: 30.h,
                    color:  Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
                  '${widget.amount} ${widget.currency}',
                  style: TextStyle(
                    fontSize: 25.h,
                    color:  Colors.black,
                    fontWeight:FontWeight.w400
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
