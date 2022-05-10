import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';

class CheckUpScreen extends StatelessWidget {
  String? date;
  String? time;
  String? address;
  String? doctorName;
  var promoControlling = TextEditingController();
  CheckUpScreen({this.date, this.time, this.address, this.doctorName});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        blue: true,
        title: 'CheckUp',
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        }
      ),
      body: Stack(
        children: [
          defaultContainerScreen(
            height: height * 0.3
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/image/amr.jpeg',
                            ),
                            radius: 34,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(
                                  text: 'Amr Nasser',
                                  color: '#262c3d',
                                  size: 18.0,
                                  textAlign: TextAlign.start,
                                  bold: true),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person, size: 14, color: HexColor('#23b2ff'),),
                                  defaultText(
                                      text: 'Male',
                                      color: '#262c3d',
                                      size: 14.0,
                                      textAlign: TextAlign.start,
                                      bold: true),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_sharp, size: 14, color: HexColor('#ff6f5b'),),
                                  defaultText(
                                      text: '30/06/2000',
                                      color: '#262c3d',
                                      size: 14.0,
                                      textAlign: TextAlign.start,
                                      bold: true),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Divider(color: Colors.purple,height: 2),
                              SizedBox(height: 15,),
                              defaultText(
                                size: 16.0,
                                bold: true,
                                text: 'Check-up time',
                                color: '#262c3d',
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_sharp, size: 14, color: HexColor('#23b2ff'),),
                                  defaultText(
                                      text: '$date',
                                      color: '#262c3d',
                                      size: 14.0,
                                      textAlign: TextAlign.start,
                                      bold: true),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined, size: 14, color: HexColor('#ff6f5b'),),
                                  defaultText(
                                      text: '${time}PM',
                                      color: '#262c3d',
                                      size: 14.0,
                                      textAlign: TextAlign.start,
                                      bold: true),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 14, color: HexColor('#2ad3e7'),),
                                  defaultText(
                                      text: '$address',
                                      color: '#262c3d',
                                      size: 14.0,
                                      textAlign: TextAlign.start,
                                      bold: true),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/image/amr.jpeg'
                          ,width: 60,height: 60,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                              text: '$doctorName',
                              bold: true,
                              size: 14.0,
                              color: '#262c3d'
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              defaultText(
                                  text: 'Price:',
                                  bold: true,
                                  size: 14.0,
                                  color: '#262c3d'
                              ),
                              SizedBox(width: 30,),
                              defaultText(
                                  text: '250EGP',
                                  bold: true,
                                  size: 14.0,
                                  color: '#23b2ff'
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                        text: 'Discount',
                        color: '#262c3d',
                        size: 16.0,
                        bold: true
                      ),
                      SizedBox(height: 5.0,),
                      defaultTextFormField(
                        hint: 'Promotion code',
                        control: promoControlling,
                        textInputType: TextInputType.text
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      defaultText(
                        bold: true,
                        text: 'Total',
                        size: 18.0,
                        color: '#747f9e'
                      ),
                      Spacer(),
                      defaultText(
                          bold: true,
                          text: '250EGP',
                          size: 20.0,
                          color: '#23b2ff'
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                defaultAccessButton(function: (){}, text: 'Payment'),
                SizedBox(height: 10,),
                defaultAccessButton(function: (){
                  _showMyDialog(context: context);
                }, text: 'Cancellation'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
Future<void> _showMyDialog({context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Cancellation Of Appointment.',),
        content: SingleChildScrollView(
          child: Text('Are you sure you want to cancel this appointment?'),
        ),
        actions: <Widget>[
          Row(
            children: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Spacer(),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
