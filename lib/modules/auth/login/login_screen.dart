import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/cubit/cubit.dart';
import 'package:homeclinic/modules/auth/cubit/states.dart';
import 'package:homeclinic/modules/auth/register/register_doctor_screen.dart';
import 'package:homeclinic/modules/auth/register/register_screen.dart';
import 'package:homeclinic/modules/view/main_screen/main_screen.dart';
import 'package:homeclinic/shared/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool remeber = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(create: (context)=> AuthCubit(),
    child: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state){
        if(state is AuthLoginSuccess){

          defaultFinishNavigate(
            context: context,
            screen: MainScreen()
          );
        }
        if(state is AuthLoginError){
          Fluttertoast.showToast(
              msg: "The username or password is incorrect",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
      builder: (context, state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: defaultAppBar(
              action: false,
              blue: true,
              leading: false,
              title: 'Login'
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: [

                  defaultContainerScreen(
                      height: height
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
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
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        child: Text('Email or phone number',
                                            textAlign: TextAlign.start)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    defaultTextFormField(
                                      hint: 'Enter email or phone number',
                                      control: emailController,
                                      valdiate: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter email or phone number';
                                        }
                                      },
                                      textInputType: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        child: Text('Password',
                                            textAlign: TextAlign.start)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    defaultTextFormField(
                                      hint: 'Enter Password',
                                      control: passwordController,
                                      valdiate: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Password';
                                        }
                                      },
                                      textInputType: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: remeber,
                                              shape: CircleBorder(),
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  remeber = value!;
                                                });
                                              },
                                            ),
                                            Text('Remeber me'),
                                          ],
                                        ),
                                        Spacer(),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Forgot password?',
                                              style: TextStyle(
                                                  color: HexColor('#2ad3e7'),
                                                  fontSize: 14),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                              if(state is AuthLoginLoading)CircularProgressIndicator(),
                              if(state is! AuthLoginLoading)defaultAccessButton(
                                  text: 'Login',
                                  function: () {
                                    if(formKey.currentState!.validate()){
                                      AuthCubit.get(context).postLogin(
                                          password: passwordController.text,
                                          email: emailController.text
                                      );
                                    }
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                                height: 10,
                                child:
                                Divider(color: HexColor('#d7d9e5')),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: TextStyle(fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  defaultNavigateTo(
                                      context: context,
                                      screen: RegisterScreen()
                                  );
                                },
                                child: Text(
                                  'Sign up now!',
                                  style: TextStyle(
                                      fontSize: 14, color: HexColor('#23b2ff')),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: defaultText(
                                      text: 'Create Doctor Account?',
                                      color: '#23b2ff',
                                      size: 14.0,
                                      bold: true
                                  ),
                                  onTap: (){
                                    defaultNavigateTo(
                                        context: context,
                                        screen: RegisterDoctorScreen()
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}
