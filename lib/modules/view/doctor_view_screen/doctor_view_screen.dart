import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/cubit/cubit.dart';
import 'package:homeclinic/modules/cubit/states.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/doctor_information_screen/doctor_information_screen.dart';
import 'package:homeclinic/shared/components.dart';

class DoctorViewScreen extends StatefulWidget {
  @override
  State<DoctorViewScreen> createState() => _DoctorViewScreenState();
}

class _DoctorViewScreenState extends State<DoctorViewScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  void initState() {
    tabController = TabController(length: 8, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeClinicCubit, HomeClinicStates>(
        listener: (context, state){},
      builder: (context, state){
          var homeClinic = HomeClinicCubit.get(context);
          return DefaultTabController(
            length: 8,
            initialIndex: tabController.index,
            child: Scaffold(
                backgroundColor: HexColor('#f9f9f9'),
                appBar: defaultAppBar(
                    bottom: TabBar(
                      isScrollable: true,
                      onTap: (void index) {
                        if(tabController.index == 0)homeClinic.viewDoctorNeurologists(spec:'neurologists');
                        setState(() {});
                      },
                      controller: tabController,
                      tabs: <Widget>[
                        Tab(
                            child: Text(
                              'Neurologists',
                              style: TextStyle(
                                  color: (tabController.index == 0)
                                      ? HexColor('#23b2ff')
                                      : HexColor('#b0b3c7')),
                            )),
                        Tab(
                          child: Text(
                            'Dentist',
                            style: TextStyle(
                                color: (tabController.index == 1)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'InternalMedicine',
                            style: TextStyle(
                                color: (tabController.index == 2)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Ophthalmologists',
                            style: TextStyle(
                                color: (tabController.index == 3)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Pediatricians',
                            style: TextStyle(
                                color: (tabController.index == 4)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Otolaryngologists',
                            style: TextStyle(
                                color: (tabController.index == 5)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Dermatologists',
                            style: TextStyle(
                                color: (tabController.index == 6)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Gynecologists',
                            style: TextStyle(
                                color: (tabController.index == 7)
                                    ? HexColor('#23b2ff')
                                    : HexColor('#b0b3c7')),
                          ),
                        ),
                      ],
                    ),
                    action: true,
                    leading: true,
                    leadingIcon: Icons.arrow_back_ios_sharp,
                    title: 'Doctor List',
                    leadingFunction: () {
                      Navigator.pop(context);
                    },
                    actionIcon: Icons.search),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: ListView.separated(
                        shrinkWrap: true,
                        reverse: false,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            defaultcontainer((tabController.index == 0)
                                ? homeClinic.doctorNeurologists[index]
                                : (tabController.index == 1)
                                ? homeClinic.doctorDentist[index]
                                : (tabController.index == 2)
                                ? homeClinic.doctorInternalMedicine[index]
                                : (tabController.index == 3)
                                ? homeClinic.doctorOphthalmologists[index]
                                : (tabController.index == 4)
                                ? homeClinic.doctorPediatricians[index]
                                : (tabController.index == 5)
                                ? homeClinic.doctorOtolaryngologists[index]
                                : (tabController.index == 6)
                                ? homeClinic.doctorDermatologists[index]
                                : (tabController.index == 7)
                                ? homeClinic.doctorGynecologists[index]
                                : homeClinic.doctorNeurologists[index], context),
                        separatorBuilder: (context, index) => SizedBox(height: 10),
                        itemCount: (tabController.index == 0)
                            ? homeClinic.doctorNeurologists.length
                            : (tabController.index == 1)
                            ? homeClinic.doctorDentist.length
                            : (tabController.index == 2)
                            ?  homeClinic.doctorInternalMedicine.length
                            : (tabController.index == 4)
                            ? homeClinic.doctorOphthalmologists.length
                            : (tabController.index == 4)
                            ? homeClinic.doctorPediatricians.length
                            : (tabController.index == 5)
                            ? homeClinic.doctorOtolaryngologists.length
                            : (tabController.index == 6)
                            ? homeClinic.doctorDermatologists.length
                            : (tabController.index == 7)
                            ? homeClinic.doctorGynecologists.length
                            : homeClinic.doctorNeurologists.length),
                  ),
                )),
          );
      },
    );
  }
}

Widget defaultcontainer(doc, context) => InkWell(
  onTap: (){
    defaultNavigateTo(context: context, screen: DoctorInformationScreen(doctorName: 'Dr.${doc['name']}',));
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
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      '${doc['image']}',
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
                    'Dr. ${doc['username']}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#262c3d')),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${doc['specialize']}',
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
