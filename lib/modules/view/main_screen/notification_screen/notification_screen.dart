import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';

class NotificationScreen extends StatelessWidget {
  List notification = [
    {
      'title' : 'The doctor has ended his consultation',
      'body' : 'Your consultation is timed and finished, please rate us so we can serve you better!'
    },
    {
      'title' : 'The doctor has ended his consultation',
      'body' : 'Your consultation is timed and finished, please rate us so we can serve you better!'
    },
    {
      'title' : 'The doctor has ended his consultation',
      'body' : 'Your consultation is timed and finished, please rate us so we can serve you better!'
    },
    {
      'title' : 'The doctor has ended his consultation',
      'body' : 'Your consultation is timed and finished, please rate us so we can serve you better!'
    },
    {
      'title' : 'The doctor has ended his consultation',
      'body' : 'Your consultation is timed and finished, please rate us so we can serve you better!'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        action: false,
        title: 'Notification',
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: ListView.separated(
            shrinkWrap: true,
              reverse: false,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => defaultNotiContainer(
                notification: notification[index]
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: notification.length
          )
        ),
      ),
    );
  }
}
Widget defaultNotiContainer({notification})=>Container(
  child: Stack(
    alignment: Alignment.topLeft,
    children: [
      Column(
        children: [
          Container(
          height: 18,
            color: Colors.white,
            width: double.infinity,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(
                      0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              defaultText(size: 16.0, color: '#262c3d', bold: true,
                  textAlign: TextAlign.start,
                  text: '${notification['title']}'),
              SizedBox(height: 5,),
              defaultText(size: 14.0, color: '#747f9e', bold: true,
                  textAlign: TextAlign.start,
                  text: '${notification['body']}'),
            ],
          ),
    ),
          SizedBox(height: 5,)
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Container(
          width: 40,
          height: 40 ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: HexColor('#ffe2de'),
              borderRadius: BorderRadius.circular(15.0)),
          child:  Icon(
            Icons.notifications_none_sharp,
            color: HexColor('#ff6f5b'),
          ),
        ),
      ),
    ],
  ),
);
