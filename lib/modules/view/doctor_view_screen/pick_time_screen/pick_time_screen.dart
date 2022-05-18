import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/check_up_screen/check_up_screen.dart';
import 'package:homeclinic/shared/components.dart';
import 'package:intl/intl.dart';

class PickTimeScreen extends StatefulWidget {
  String? hospitalName;
  String? doctorName;
  String? doctorImage;
  var doctorId;
  var clinicImage;
  var clinicCity;
  var clinicWorkTime;
  var clinicAddress;
  var doctorPrice;
  PickTimeScreen({this.hospitalName,this.clinicWorkTime,this.doctorPrice, this.doctorName,this.clinicAddress,this.clinicCity,this.clinicImage, this.doctorId,this.doctorImage});

  @override
  State<PickTimeScreen> createState() => _PickTimeScreenState();
}

class _PickTimeScreenState extends State<PickTimeScreen> {
  String? selectedTime;
  Future<void> displayTimeDialog() async {
    final TimeOfDay? time =
    await showTimePicker(context: context, initialTime: TimeOfDay.now(),
        cancelText: 'CANCEL',
        confirmText: "CONFIRM",
        helpText: "PICK TIME"
    );
    if (time != null) {
      setState(() {
        selectedTime = time.format(context);
        print(selectedTime);
      });
    }
  }
  String? appointmentString;
  DateTime? appointment;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
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
                          child: Image.network(
                            'http://res.cloudinary.com/clinichome/${widget.clinicImage}',
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
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
                        '${widget.doctorName}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#262c3d')),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.clinicCity}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#b0b3c7')),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.clinicAddress}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#b0b3c7')),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.clinicWorkTime}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#23b2ff')),
                      ),
                    ],
                  ),
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
                          appointmentString = "${appointment!.month}/${appointment!.day}/${appointment!.year}";
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
                          text: 'Set the time that suits you from the specified work time',
                          bold: true,
                          color: '#262c3d',
                          size: 16.0,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: (){
                          displayTimeDialog();
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
                                child: Text((selectedTime == null)
                                    ? 'Pick The Time'
                                    : '$selectedTime'),
                              ),
                              Icon(Icons.timer,
                                  color: HexColor('#23b2ff')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            defaultAccessButton(
              text: 'Next',function: (){
               defaultNavigateTo( context: context, screen: CheckUpScreen(doctorName: widget.doctorName,doctorImage: widget.doctorImage, doctorPrice: widget.doctorPrice),);
            }
            )
          ],
            ),
          ),
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
