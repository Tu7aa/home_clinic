import 'package:flutter/material.dart';
import 'package:homeclinic/modules/view/main_screen/home_screen/home_screen.dart';
import 'package:homeclinic/shared/components.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        leading: false,
        title: 'Schedule A Schedule',
        action: true,
        actionIcon: Icons.schedule
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              height: height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultText(text: 'You do not have an appointment!', size: 18.0, color: '#262c3d', bold: true),
                  SizedBox(height: 10,),
                  defaultText(text: 'Book a health care service right away \n for you and your family!', size: 16.0, color: '#747f9e', bold: true),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.asset('assets/image/schedule.png')
                ),
                Expanded(
                    child: defaultAccessButton(
                    text: 'Make an appointment',
                    function: (){}
                )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
