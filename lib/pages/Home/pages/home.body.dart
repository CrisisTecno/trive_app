import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/my_chip_scroll.widget.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SearchWidget(
                  label: 'Busca Expertos',
                  icon: Icon(
                    Icons.search,
                    size: 40.h,
                    color: primary,
                  ),
                  borderColor: Colors.black.withOpacity(0.1),
                  borderFocusedColor: Color(0xff0E0E0E)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ReusableChipsRow(
                chipLabels: [
                  'Marketing',
                  'Finanzas',
                  'Ventas',
                  'Publicidad',
                  'Liderazgo',
                  'Bienestar'
                ],
                onSelectionChanged: (index, isSelected) {
                  print(
                      'Chip $index is now ${isSelected ? 'selected' : 'deselected'}');
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ClipRRect(
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(30.h)),
                child: Image.network(banner)),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                children: [
                  Text(
                    'Conexiones para ti',
                    style:
                        TextStyle(fontSize: 23.h, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Filtrar',
                    style:
                        TextStyle(fontSize: 18.h, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardConexion(),
                  CardConexion(),
                  CardConexion(),
                  CardConexion(),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),
            SocialCard(),
            SocialCard(),
          ],
        ),
      ),
    );
  }
}
