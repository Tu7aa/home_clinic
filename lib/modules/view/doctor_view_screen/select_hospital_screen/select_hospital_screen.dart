import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/cubit_doctor/cubit.dart';
import 'package:homeclinic/modules/cubit_doctor/states.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/pick_time_screen/pick_time_screen.dart';
import 'package:homeclinic/shared/components.dart';

class SelectHospitalScreen extends StatefulWidget {
  var id;
  String? doctorName;
  var doctorPrice;
  var doctorImage;
  SelectHospitalScreen({this.doctorName, this.id, this.doctorPrice, this.doctorImage});
  @override
  State<SelectHospitalScreen> createState() => _SelectHospitalScreenState();
}

class _SelectHospitalScreenState extends State<SelectHospitalScreen> {
  String? selectArea;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> HomeClinicDoctorCubit()..viewDoctorClinic(id: widget.id),
    child: BlocConsumer<HomeClinicDoctorCubit, HomeClinicDoctorStates>(
      listener: (context, state){},
      builder: (context,state){
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Container(
              //     color: Colors.white,
              //     child: DropdownButton<String>(
              //       iconEnabledColor: HexColor('#ff6f5b'),
              //       underline: Divider(
              //         color: Colors.white,
              //       ),
              //       isExpanded: false,
              //       value: selectArea,
              //       hint: Text('Area'),
              //       items:
              //       <String>['Cairo', 'Giza', 'Alexandria'].map((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           selectArea = value;
              //         });
              //       },
              //     ),
              //   ),
              // ),
            ],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: (state is ViewDoctorsLoading) ?Center(
              child: CircularProgressIndicator(),
            )
            :Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ListView.separated(
                  shrinkWrap: true,
                  reverse: false,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      defaultcontainer(HomeClinicDoctorCubit.get(context).clinic[index], context, widget.doctorName, widget.id, widget.doctorImage, widget.doctorPrice),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: HomeClinicDoctorCubit.get(context).clinic.length),
            ),
          ),
        );
      },
    ),
    );
  }
}

Widget defaultcontainer(hospital,context, doctorName, id, doctorImage, doctorPrice) => InkWell(
  onTap: (){
    defaultNavigateTo(context: context, screen: PickTimeScreen(hospitalName: hospital['clinicname'], doctorName: doctorName,
      clinicAddress: hospital['address'],clinicCity:hospital['city'],clinicWorkTime: hospital['workhours'], clinicImage: hospital['clinic_image'],doctorId: id, doctorImage: doctorImage, doctorPrice:doctorPrice ,));
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
                    child: Image.network(
                      'http://res.cloudinary.com/clinichome/${hospital['clinic_image']}',
                      height: 100,
                      width: 100,
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
                    '${hospital['clinicname']}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#262c3d')),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${hospital['city']}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#b0b3c7')),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${hospital['address']}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#b0b3c7')),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${hospital['workhours']}',
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

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
