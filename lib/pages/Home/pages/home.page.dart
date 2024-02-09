import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/my_chip_scroll.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar:CustomAppBar() ,
        body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 20.h,),
          child: Column(
            children: [
              SizedBox(
                height: screensize.height*0.78,
                width: screensize.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       
                      Padding(
                        padding: EdgeInsets.symmetric( vertical: 8.h),
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
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(30.h)),
                            child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/cad7/d9fb/f7a893a626e803a9c0c6644e499ba574?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=odvfR24Zoiy8awIX2Eq3NKJMk0zL6T~cDF0VFT2~zdC3wYVBMSzsz4MtLMZPNMxOGDwSp9nUy8ogyjnNZMfcrtMy3zcLNrgdwdrHAS2q0XztM2seybc0s329zDcxGuM4OfruCF591BDcTz8Q6JNKuE9UCq7sqd26nQeVmvJLMAFv3rBLNtvpBT-U9VZufzVe2~DROdMvREBaLtjPiH0fErsB6ONlVyoHtfo7NHDwDEh3lqzKI~V~yPGPfAWj4RpFwz83fZcVPV3guw6hKexCelYpyJcxqd3Hw-S6WAJ5cZTesFkQKSVOX7Kx95sHLqcMFo4phh6FCNaYawAuCLVVcQ__')),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text('Conexiones para ti',style: TextStyle(fontSize: 23.h,fontWeight: FontWeight.bold ),),
                        Spacer(),
                        Text('Filtrar',style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.w400 ),),
                        ],
                      ),
                    SocialCard(),
                    SocialCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white,size: 35.h, ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;

  CategoryChip({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(title),
        selected: false,
        onSelected: (bool selected) {},
        backgroundColor: Color(0xffF6F6F6),
        selectedColor: Color(0xff3A5FEB).withOpacity(0.2),
      ),
    );
  }
}
