import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/select_hospital_screen/select_hospital_screen.dart';
import 'package:homeclinic/shared/components.dart';

class DoctorInformationScreen extends StatelessWidget {
  String? doctorName;
  DoctorInformationScreen({this.doctorName});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
          action: true,
          leading: true,
          title: 'Doctor Information',
          actionIcon: Icons.share,
          actionFunction: () {},
          leadingIcon: Icons.arrow_back_ios_sharp,
          leadingFunction: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              padding: EdgeInsets.only(top: 15, bottom: 15, right: 0, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/amr.jpeg',
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                              text: '$doctorName',
                              color: '#262c3d',
                              size: 18.0,
                              textAlign: TextAlign.start,
                              bold: true),
                          SizedBox(
                            height: 5,
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
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: HexColor('#23b2ff'),
                              ),
                              Container(
                                width: width * 0.44,
                                child: Text(
                                  'Consultant of dermatology, venereology & cosmotic',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: HexColor('#747f9e'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      defaultAppBarIcons(icon: Icons.chat)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Divider(
                      height: 2,
                      color: HexColor('#bde7ff'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: HexColor('#d3efff'),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.star_border_purple500_sharp,
                                      color: HexColor('#23b2ff'),
                                      size: 18,
                                    ),
                                    onPressed: () {},
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Review')
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: HexColor('#ffe2de'),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: HexColor('#ff6f5b'),
                                      size: 18,
                                    ),
                                    onPressed: () {},
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Thanks')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            defaultText(
                text: 'Choose a consultation with a Doctor',
                size: 18.0,
                color: '#262c3d',
                bold: true),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.chat_sharp,
                    color: HexColor('#23b2ff'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  defaultText(
                      text: 'Chat with Doctor',
                      size: 16.0,
                      color: '#262c3d',
                      bold: true),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 16,
                      color: HexColor('#23b2ff'),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                defaultText(
                  size: 18.0,
                  text: 'Specialist',
                  bold: true,
                  color: '#262c3d',
                ),
                Spacer(),
                defaultText(
                  size: 14.0,
                  text: 'See all',
                  bold: true,
                  color: '#2ad3e7',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.bottomCenter,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: HexColor('#d3efff'),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.star_border_purple500_sharp,
                                  color: HexColor('#23b2ff'),
                                  size: 18,
                                ),
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Review')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.bottomCenter,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: HexColor('#ffe2de'),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: HexColor('#ff6f5b'),
                                  size: 18,
                                ),
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Thanks')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                defaultText(
                  size: 18.0,
                  text: 'Reviews from users',
                  bold: true,
                  color: '#262c3d',
                ),
                Spacer(),
                defaultText(
                  size: 14.0,
                  text: 'See all',
                  bold: true,
                  color: '#2ad3e7',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  reverse: false,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => defaultUserComment(),
                  separatorBuilder: (context, index) => SizedBox(width: 0),
                  itemCount: 2),
            ),
            SizedBox(
              height: 5,
            ),
            defaultAccessButton(
                text: 'Schedule a consultation', function: () {
                  defaultNavigateTo(context: context, screen: SelectHospitalScreen(doctorName: doctorName,));
            })
          ],
        ),
      )),
    );
  }
}

Widget defaultUserComment() => Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundImage: AssetImage('assets/image/amr.jpeg'),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amr Nasser'),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: HexColor('#ffc107'),
                    size: 14,
                  ),
                  Text('4.5',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#747f9e'))),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('Good Place and person')
            ],
          )
        ],
      ),
    );
