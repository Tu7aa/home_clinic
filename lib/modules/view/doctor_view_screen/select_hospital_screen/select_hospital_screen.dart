import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/pick_time_screen/pick_time_screen.dart';
import 'package:homeclinic/shared/components.dart';

class SelectHospitalScreen extends StatefulWidget {
  String? doctorName;
  SelectHospitalScreen({this.doctorName});
  @override
  State<SelectHospitalScreen> createState() => _SelectHospitalScreenState();
}

class _SelectHospitalScreenState extends State<SelectHospitalScreen> {
  String? selectArea;
  List hospital = [
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
    {'name': 'Al Saudi Elalmany'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Select Hospital',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Container(
              height: 40,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: HexColor('#d3efff'),
                  borderRadius: BorderRadius.circular(15.0)),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 16,
                    color: HexColor('#23b2ff'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.white,
              child: DropdownButton<String>(
                iconEnabledColor: HexColor('#ff6f5b'),
                underline: Divider(
                  color: Colors.white,
                ),
                isExpanded: false,
                value: selectArea,
                hint: Text('Area'),
                items:
                    <String>['Cairo', 'Giza', 'Alexandria'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectArea = value;
                  });
                },
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListView.separated(
              shrinkWrap: true,
              reverse: false,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  defaultcontainer(hospital[index], context, widget.doctorName),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: hospital.length),
        ),
      ),
    );
  }
}

Widget defaultcontainer(hospital,context, doctorName) => InkWell(
  onTap: (){
    defaultNavigateTo(context: context, screen: PickTimeScreen(hospitalName: hospital['name'], doctorName: doctorName,));
  },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
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
                    '${hospital['name']}',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
    );
