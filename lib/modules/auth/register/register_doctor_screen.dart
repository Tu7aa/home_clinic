import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/cubit/cubit.dart';
import 'package:homeclinic/modules/auth/cubit/states.dart';
import 'package:homeclinic/modules/auth/register/otp_doctor_screen.dart';
import 'package:homeclinic/modules/auth/register/otp_screen.dart';
import 'package:homeclinic/shared/components.dart';

class RegisterDoctorScreen extends StatelessWidget {
  var emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(create: (context)=> AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if(state is AuthEmailValidSuccess){
            defaultNavigateTo(
                screen: OtpDoctorScreen(
                ),
                context: context
            );
          }
        },
        builder: (context, state){
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: defaultAppBar(
                  action: false,
                  blue: true,
                  leading: true,
                  title: 'Register',
                  leadingIcon: Icons.arrow_back_ios_sharp,
                  leadingFunction: (){
                    Navigator.pop(context);
                  }
              ),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      defaultContainerScreen(height: height),
                      Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 200),
                          child: Column(
                            children: [
                              Stack(
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
                                        Container(
                                            width: double.infinity,
                                            child: Text('Email or phone number',
                                                textAlign: TextAlign.start)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        defaultTextFormField(
                                          hint: 'Enter email',
                                          control: emailController,
                                          valdiate: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Enter email';
                                            }
                                          },
                                          textInputType: TextInputType.text,
                                        ),
                                        SizedBox(
                                          height: 80,
                                        )
                                      ],
                                    ),
                                  ),
                                  if(state is AuthEmailValidLoading)CircularProgressIndicator(),
                                  if(state is! AuthEmailValidLoading)defaultAccessButton(text: 'Confirm',
                                      function: () {
                                        if(formKey.currentState!.validate()){
                                          AuthCubit.get(context).postEmailValid(
                                              email: emailController.text
                                          );
                                        }
                                      }),
                                ],
                                alignment: Alignment.bottomCenter,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    child:
                                    Divider(color: HexColor('#d7d9e5'), height: 30),
                                  ),
                                  Container(
                                    width: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'or',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child:
                                    Divider(color: HexColor('#d7d9e5'), height: 30),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(FontAwesomeIcons.facebook,
                                            color: Colors.blue, size: 50.0)),
                                  ),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(FontAwesomeIcons.google,
                                            color: Colors.red, size: 50.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Sign in!',
                                      style: TextStyle(
                                          fontSize: 14, color: HexColor('#23b2ff')),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
