import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

import '../widgets/app_bar.publish.dart';
import '../widgets/chip_publish_privacity.dart';
import '../widgets/input_text.dart';
import '../widgets/publish_bottom_meeting.dart';

class MeetingDetailsPage extends StatefulWidget {
  @override
  _MeetingDetailsPageState createState() => _MeetingDetailsPageState();
}

class _MeetingDetailsPageState extends State<MeetingDetailsPage> {
  String dropdownValue = 'Público';
  String onlineStatus = 'Online';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomButton(
                  onClick: () {
                  },
                  title: 'Continuar',
                  backgroundColor: primary,
                  titleColor: Colors.white,
                ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessagesAppBarPubish(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 140.h,
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], 
                        borderRadius:
                            BorderRadius.circular(16), 
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Título',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.h)),
                              Spacer(),
                              ChipOptionPublishPrivacity(
                                label: 'Public',
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30.h,
                          ),
                          InputTextPublish(
                              label: 'Titulo de la reunion',
                              borderColor: Colors.black.withOpacity(0.2),
                              borderFocusedColor: primary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descripción',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.h)),
                    SizedBox(height: 16.h),
                    InputTextPublish(
                        label: '¿Qué se abordará en la reunión?',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 16.h),
                    ChipOptionPublishPrivacity(
                      label: 'Online',
                    ),
                    SizedBox(height: 16.h),
                    InputTextPublish(
                        label: 'https://meet.google.com/cvq-qrri-rus',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 16),
                  ],
                  
              ),
             
              ),

               PublishButton(
                    height: 550.h,
                    width: 1000.w,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


                          //menu desplegable
                          // DropdownButton<String>(
                          //   value: dropdownValue,
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue!;
                          //     });
                          //   },
                          //   items: <String>['Público', 'Privado', 'Oculto']
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
              // DropdownButton<String>(
              //   value: onlineStatus,
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       onlineStatus = newValue!;
              //     });
              //   },
              //   items: <String>['Online', 'Presencial', 'Híbrido']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              // SizedBox(height: 8),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'https://meet.google.com/cvq-qrii-rus',
              //     suffixIcon: Icon(Icons.link),
              //   ),
              // ),