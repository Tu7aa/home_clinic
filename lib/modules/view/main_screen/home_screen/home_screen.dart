import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/doctor_view_screen.dart';
import 'package:homeclinic/modules/view/main_screen/news_screen/news_screen.dart';
import 'package:homeclinic/modules/view/main_screen/notification_screen/notification_screen.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/address_screen/address_screen.dart';
import 'package:homeclinic/shared/components.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address = '${place.locality}, ${place.country}';
    print(Address);
    setState(()  {
    });
  }

  List doctor = [
    {'id': 0,'name': 'Noha', 'image': 'assets/image/doctor.png'},
    {'id': 1,'name': 'Mona', 'image': 'assets/image/doctor.png'},
    {'id': 2,'name': 'Abeer', 'image': 'assets/image/doctor.png'},
    {'id': 3,'name': 'Yara', 'image': 'assets/image/doctor.png'},
  ];

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var day = DateFormat('EEEE, d MMM').format(date);
    print(day);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          defaultAppBarIcons(icon: Icons.notifications_none_sharp,
            function: (){
              defaultNavigateTo(context: context, screen: NotificationScreen());
            }
          ),
        ],
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/image/amr.jpeg'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(color: '#b0b3c7', size: 16.0, text: day, bold: true),
              SizedBox(
                height: 5,
              ),
              defaultText(
                  color: '#262c3d',
                  size: 24.0,
                  text: 'Hi, Amr Nasser',
                  bold: true),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  defaultText(
                      color: '#262c3d',
                      size: 18.0,
                      text: 'Don’t forget',
                      bold: true),
                  Spacer(),
                  defaultText(
                      color: '#ff6f5b', size: 14.0, text: 'clear', bold: false),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: HexColor('#b0b3c7'),
                    )),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/image/history.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    defaultText(
                        color: '#262c3d',
                        size: 16.0,
                        text: 'Meet Dr. Maher Mohamed',
                        bold: true),
                    SizedBox(
                      width: 15,
                    ),
                    defaultText(
                        color: '#2ad3e7',
                        size: 12.0,
                        text: '14:30 PM',
                        bold: true),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defaultText(
                  color: '#262c3d',
                  size: 18.0,
                  text: 'What are you looking for?',
                  bold: true),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  defaultLookingContainer(
                      text: 'General\nCheck-up',
                      function: (){
                        defaultNavigateTo(context: context, screen: AddressScreen());
                      },
                      src: 'assets/image/general.png'),
                  defaultLookingContainer(
                      text: 'Chat with\nDoctor', src: 'assets/image/chat.png'),
                  defaultLookingContainer(
                      text: 'Health\nNews',
                      function: (){
                        defaultNavigateTo(context: context, screen: NewsScreen());
                      },
                      src: 'assets/image/healthyNews.png'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  defaultText(
                      color: '#262c3d',
                      size: 18.0,
                      text: 'Top Rate Doctors',
                      bold: true),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      defaultNavigateTo(context: context, screen: DoctorViewScreen());
                    },
                    child: defaultText(
                        color: '#ff6f5b',
                        size: 12.0,
                        text: 'All Doctors',
                        bold: true),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  reverse: false,
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=> defaultDoctorContainer(
                      doc: doctor[index]
                    ),
                    separatorBuilder: (context, index)=> SizedBox(width: 15),
                    itemCount: doctor.length
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
Widget defaultDoctorContainer({doc}) => Stack(
      children: [
        Container(
          height: 300,
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(
                  1,3), // changes position of shadow
                ),
              ],
          color: HexColor('#23b2ff'),
          borderRadius: BorderRadius.circular(15.0),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: defaultText(
                      color: '#ffffff',
                      size: 16.0,
                      text: 'Dr. Amr Nasser',
                      bold: true),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#e7e5ff'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#E2DED0'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#e7e5ff'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#E2DED0'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ],
                  ),
                  Image.asset('${doc['image']}',height: 250, width: 150),
                  Column(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#e7e5ff'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#E2DED0'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#e7e5ff'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: HexColor('#E2DED0'),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )

      ],
    );

Widget defaultLookingContainer({src, text, function}) => Expanded(
      child: InkWell(
        onTap: function,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          width: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(src, width: 30, height: 30),
              SizedBox(
                height: 5,
              ),
              defaultText(color: '#262c3d', size: 14.0, text: text, bold: true),
            ],
          ),
        ),
      ),
    );
