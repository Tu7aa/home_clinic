import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/cubit/cubit.dart';
import 'package:homeclinic/modules/auth/cubit/states.dart';
import 'package:homeclinic/modules/auth/register/signup.dart';
import 'package:homeclinic/modules/auth/register/signup_doctor.dart';
import 'package:homeclinic/modules/view/main_screen/main_screen.dart';
import 'package:homeclinic/shared/components.dart';

class OtpDoctorScreen extends StatefulWidget {

  @override
  State<OtpDoctorScreen> createState() => _OtpDoctorScreenState();
}

class _OtpDoctorScreenState extends State<OtpDoctorScreen> {

  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 40;
  int currentSeconds = 0;
  Timer? timer;
  var time;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout({int? milliseconds}) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
      });
      time = timer.tick;
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
    });
  }
  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String? codes;
    return BlocProvider(create: (context)=> AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if(state is AuthOtpValidSuccess){
            defaultFinishNavigate(
                context: context,
                screen: SignUpDoctorScreen()
            );
          }
        },
        builder: (context, state){
          return Scaffold(
            appBar: defaultAppBar(
              action: false,
              leading: true,
              leadingIcon: Icons.arrow_back_ios_sharp,
              blue: true,
              leadingFunction: (){
                Navigator.pop(context);
              },
              title: 'Verify Your Number',
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  defaultContainerScreen(
                      height: height
                  ),
                  Container(
                    height: height * 0.9,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15.0),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Enter the verify number that sent to your phone recently.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: HexColor('#747f9e')),
                                        ),
                                        SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: OtpTextField(
                                            numberOfFields: 4,
                                            borderColor: Colors.white,
                                            textStyle: TextStyle(color: HexColor('#23b2ff')),
                                            fieldWidth: 50,
                                            borderRadius: BorderRadius.circular(20),
                                            showFieldAsBox: true,
                                            onSubmit: (String? verificationCode){
                                              AuthCubit.get(context).postVerify(
                                                  otp: verificationCode
                                              );
                                              setState(() {
                                                timer!.cancel();
                                              });
                                            }, // end onSubmit
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
                                        )
                                      ],
                                    ),
                                  ),
                                  if(state is AuthOtpValidLoading)CircularProgressIndicator(),
                                ],
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                if(time == 40){
                                  startTimeout();
                                }else{
                                  null;
                                }
                              } ,
                              child: Text('Resend ($timerText)', style: TextStyle(color: (time == 40) ? HexColor('#2ad3e7') : HexColor('#b0b3c7')),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
