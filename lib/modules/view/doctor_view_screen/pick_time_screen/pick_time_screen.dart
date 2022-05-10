import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/address_location_screen/address_location_screen.dart';
import 'package:homeclinic/shared/components.dart';

class PickTimeScreen extends StatefulWidget {
  String? hospitalName;
  String? doctorName;
  PickTimeScreen({this.hospitalName, this.doctorName});

  @override
  State<PickTimeScreen> createState() => _PickTimeScreenState();
}

class _PickTimeScreenState extends State<PickTimeScreen> {
  var color = Colors.purple;
  String? time;
  bool v1 = false;
  bool v2 = false;
  bool v3 = false;
  bool v4 = false;
  String? appointmentString;
  DateTime? appointment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        title: 'Pick A Time',
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        'assets/image/Hospital.jpg',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ))),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.hospitalName}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#262c3d')),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'El-Montaza, Heliopolis',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#b0b3c7')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: HexColor('#ffc107'),
                          size: 14,
                        ),
                        Text('4.5(123)',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#747f9e'))),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          color: HexColor('#d4faff'),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: HexColor('#2ad3e7'),
                              ),
                              Text('1 km',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#2ad3e7'))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(
                  text: 'Appointment Booking',
                  bold: true,
                  color: '#262c3d',
                  size: 18.0,
                  textAlign: TextAlign.start),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  final datePick = await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1900),
                      lastDate: new DateTime(2100));
                  if (datePick != null && datePick != appointment) {
                    setState(() {
                      appointment = datePick;
                      appointmentString =
                          "${appointment!.month}/${appointment!.day}/${appointment!.year}";
                      print(appointmentString);
                    });
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: HexColor('#b0b3c7'),
                      )),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text((appointmentString == null)
                            ? 'Appointment'
                            : '$appointmentString'),
                      ),
                      Icon(Icons.calendar_today,
                          color: HexColor('#23b2ff')),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                      text: 'Time',
                      bold: true,
                      color: '#262c3d',
                      size: 16.0,
                      textAlign: TextAlign.start),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            defaultContainerTime(time: '07:00 AM',
                                function: (){

                                  v1 =!v1 ;
                                  v3 =false;
                                  v2 =false;
                                  v4 =false;
                                  setState(() {

                                  });
                                }
                                , value: v1),
                            defaultContainerTime(time: '10:00 AM',
                                function: (){
                                  v2 =!v2;
                                  v3 =false;
                                  v1 =false;
                                  v4 =false;
                                  setState(() {
                                  });
                                }
                                , value: v2),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            defaultContainerTime(time: '04:00 PM',
                                function: (){
                                  v3 =!v3;
                                  v1 =false;
                                  v2 =false;
                                  v4 =false;
                                  setState(() {

                                  });
                                }
                                , value: v3),
                            defaultContainerTime(time: '06:00 PM',
                                function: (){
                                  v4 =!v4;
                                  v3 =false;
                                  v2 =false;
                                  v1 =false;
                                  setState(() {

                                  });
                                }
                                , value: v4),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Spacer(),
        defaultAccessButton(
          text: 'Next',function: (){
            defaultNavigateTo( context: context, screen: AddressLocationScreen(time: '07:00', date: appointmentString, doctorName: widget.doctorName, ),);
        }
        )
      ],
        ),
      ),
    );
  }
}

Widget defaultContainerTime({time, function, value}) => Column(
      children: [
        InkWell(
          onTap: function,
          child: Container(
            decoration: BoxDecoration(
                border: (value == false) ? Border.all(color: HexColor('#b0b3c7')) : null,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: (value == false) ? Colors.white : HexColor('#2ad3e7'),
                borderRadius: BorderRadius.circular(15.0)),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child:
                Text(
                  '$time',
                  style: TextStyle(
                    color: (value == false) ? HexColor('#b0b3c7') : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                )
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
