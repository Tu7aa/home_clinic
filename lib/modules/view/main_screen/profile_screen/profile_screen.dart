import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/login/login_screen.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/health_profile_screen/health_profile_screen.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/information_profile_screen/information_profile_screen.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/payment_user_screen/payment_user_screen.dart';
import 'package:homeclinic/shared/components.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
      title: 'Profile',
        blue: true,
        leading: false,
        action: false
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            defaultContainerScreen(height: height * 0.3),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/image/amr.jpeg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            defaultText(
                                text: 'Amr Nasser',
                                size: 16.0,
                                color: '#262c3d',
                                bold: true),
                            defaultText(
                                text: '01008503574',
                                size: 14.0,
                                color: '#747f9e',
                                bold: true),
                          ],
                        ),
                        Spacer(),
                        Container(
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
                              },
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                          // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        profileContainer(
                          function: (){
                            defaultNavigateTo(context: context, screen: InformationProfileScreen());
                          },
                            text: 'Profile',
                            icon: Icons.person
                        ),
                        profileContainer(
                            text: 'Health Profile',
                            function: (){
                              defaultNavigateTo(context: context, screen: HealthProfileScreen());
                            },
                            icon: Icons.person_add_alt_1_rounded),
                        profileContainer(
                            text: 'Address', icon: Icons.location_on_outlined),
                        profileContainer(
                            text: 'Payment Method', icon: Icons.payment_sharp,
                        function: (){
                              defaultNavigateTo(context: context,screen: PaymentUserScreen());
                        }
                        ),
                        profileContainer(
                            text: 'Hotline',
                            icon: Icons.mobile_screen_share_sharp),
                        profileContainer(
                            text: 'About Us', icon: Icons.help_outline_sharp),
                        profileContainer(
                            color: '#ff6f5b',
                            textColor: '#ff6f5b',
                            text: 'Logout',
                            function: (){
                              defaultFinishNavigate(screen: LoginScreen(), context: context);
                            },
                            icon: Icons.logout),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget profileContainer(
        {icon, color = '#23b2ff', text, textColor = '#262c3d', function}) =>
    InkWell(
      onTap: function,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: HexColor(color),
              ),
              SizedBox(
                width: 10,
              ),
              defaultText(size: 16.0, bold: true, color: textColor, text: text)
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
