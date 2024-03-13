import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/utils.dart';

class BuyPointsScreen extends StatefulWidget {
  @override
  State<BuyPointsScreen> createState() => _BuyPointsScreenState();
}

class _BuyPointsScreenState extends State<BuyPointsScreen> {
  String selectedPrice = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MessagesAppBar(),
              Row(
                children: [
                  Padding(
                      child: Text('Comprar puntos',
                          style: TextStyle(
                              fontSize: 25.h, fontWeight: FontWeight.w600)),
                      padding: EdgeInsets.only(left: 25.h)),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 15.h,
                        runSpacing: 20.h,
                        children: [
                          AmountChip(
                            amount: '100',
                            currency: 'MXN',
                            onAmountSelected: (price) {
                              setState(() {
                                selectedPrice = price;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                    ]),
              ),
              Row(
                children: [
                  Padding(
                      child: Text('Método de pago',
                          style: TextStyle(
                              fontSize: 25.h, fontWeight: FontWeight.w600)),
                      padding: EdgeInsets.only(left: 25.h)),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              DebitCreditCard(
                label: 'Tarjeta de débito o crédito',
                svgAssetPath: 'public/assets/icons/card_credit.svg',
              ),
              SizedBox(height: 20.h),
              DebitCreditCard(
                label: 'Paypal',
                svgAssetPath: 'public/assets/icons/paypal.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
