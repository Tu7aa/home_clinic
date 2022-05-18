import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/cubit_doctor/cubit.dart';
import 'package:homeclinic/modules/cubit_doctor/states.dart';
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
    return BlocProvider(create: (context)=> HomeClinicDoctorCubit()..viewDoctors(spec: 'neurologists'),
    child: BlocConsumer<HomeClinicDoctorCubit, HomeClinicDoctorStates>(
      listener: (context, state){},
      builder: (context, state){
        var homeClinic = HomeClinicDoctorCubit.get(context);
        return DefaultTabController(
          length: 8,
          initialIndex: tabController.index,
          child: Scaffold(
              backgroundColor: HexColor('#f9f9f9'),
              appBar: defaultAppBar(
                  bottom: TabBar(
                    isScrollable: true,
                    onTap: (void index) {
                      if(tabController.index == 0)homeClinic.viewDoctors(spec:'neurologists');
                      if(tabController.index == 1)homeClinic.viewDoctors(spec:'dentist');
                      if(tabController.index == 2)homeClinic.viewDoctors(spec:'internal medicine');
                      if(tabController.index == 3)homeClinic.viewDoctors(spec:'ophthalmologists');
                      if(tabController.index == 4)homeClinic.viewDoctors(spec:'pediatricians');
                      if(tabController.index == 5)homeClinic.viewDoctors(spec:'otolaryngologists');
                      if(tabController.index == 6)homeClinic.viewDoctors(spec:'dermatologists');
                      if(tabController.index == 7)homeClinic.viewDoctors(spec:'gynecologists');
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
              body: (state is ViewDoctorsLoading) ? Center(child: CircularProgressIndicator(),) :
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: ListView.separated(
                      shrinkWrap: true,
                      reverse: false,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          defaultcontainer(homeClinic.doctors[index],context),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemCount: homeClinic.doctors.length),
                ),
              )
          ),
        );
      },
    ),
    );
  }
}

Widget defaultcontainer(doc, context) => InkWell(
  onTap: (){
    defaultNavigateTo(context: context, screen: DoctorInformationScreen(doctorName: 'Dr.${doc['username']}', doctorId: '${doc['user']}',doctorImage: '${doc['image']}',));
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
                    child: (doc['image'] != 'User has No Profile Pic') ?Image.network(
                      '${doc['image']}',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ) :
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                    )
                )
            ),
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
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
