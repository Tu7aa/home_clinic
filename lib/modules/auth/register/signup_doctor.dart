import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/cubit/cubit.dart';
import 'package:homeclinic/modules/auth/cubit/states.dart';
import 'package:homeclinic/modules/auth/login/login_screen.dart';
import 'package:homeclinic/shared/components.dart';

class SignUpDoctorScreen extends StatefulWidget {
  @override
  State<SignUpDoctorScreen> createState() => _SignUpDoctorScreenState();
}

class _SignUpDoctorScreenState extends State<SignUpDoctorScreen> {
  var nameControlling = TextEditingController();
  var passwordControlling = TextEditingController();
  var infoControlling = TextEditingController();
  var priceControlling = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? selectGender;
  String? selectSpecialize;
  String? birthDateInString;
  DateTime? birthDate;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(create: (context)=> AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if(state is AuthSignUpDoctorSuccess){
            defaultFinishNavigate(
                context: context,
                screen: LoginScreen()
            );
          }
        },
        builder: (context, state){
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: defaultAppBar(
                  title: 'Create A Doctor Profile',
                  action: false,
                  leading: true,
                  blue: true,
                  leadingIcon: Icons.arrow_back_ios_sharp,
                  leadingFunction: (){
                    Navigator.pop(context);
                  }
              ),
              body: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
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
                            defaultContainerScreen(height: height * 0.3),
                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultText(
                                      text: 'First name & Last name',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  defaultTextFormField(
                                    hint: 'Amr nasser',
                                    control: nameControlling,
                                    valdiate: (value) {
                                      if (value.isEmpty) {
                                        return 'First name & Last name';
                                      }
                                    },
                                    textInputType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultText(
                                      text: 'Password',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  defaultTextFormField(
                                    hint: '*******',
                                    control: passwordControlling,
                                    valdiate: (value) {
                                      if (value.isEmpty) {
                                        return 'enter the password';
                                      }
                                    },
                                    textInputType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultText(
                                      text: 'Date of birth',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(height: 5,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: HexColor('#b0b3c7'),
                                        )
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text((birthDateInString == null) ? 'Date of Birth' : '$birthDateInString',
                                            style: (birthDateInString == null) ? TextStyle(color: HexColor('#b0b3c7')) : null,),
                                        ),
                                        GestureDetector(
                                            child: new Icon(Icons.calendar_today, color: HexColor('#23b2ff')),
                                            onTap: ()async{
                                              final datePick= await showDatePicker(
                                                  context: context,
                                                  initialDate: new DateTime.now(),
                                                  firstDate: new DateTime(1900),
                                                  lastDate: new DateTime(2100)
                                              );
                                              if(datePick!=null && datePick!=birthDate){
                                                setState(() {
                                                  birthDate=datePick;
                                                  birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}";
                                                  print(birthDateInString);
                                                });
                                              }
                                            }
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  defaultText(
                                      text: 'Gender',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: HexColor('#b0b3c7'),
                                        )
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                                      child: DropdownButton<String>(
                                        underline: Divider(
                                          color: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: selectGender,
                                        hint: Text('Gender', style: TextStyle(color: HexColor('#b0b3c7')),),
                                        items: <String>['Male', 'Female'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value){
                                          setState(() {
                                            selectGender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultText(
                                      text: 'Specialize',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: HexColor('#b0b3c7'),
                                        )
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                                      child: DropdownButton<String>(
                                        underline: Divider(
                                          color: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: selectSpecialize,
                                        hint: Text('Specialize', style: TextStyle(color: HexColor('#b0b3c7')),),
                                        items: <String>[
                                          'neurologists',
                                          'dentist',
                                          'internal medicine',
                                          'ophthalmologists',
                                          'pediatricians',
                                          'otolaryngologists',
                                          'dermatologists',
                                          'gynecologists'
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value){
                                          setState(() {
                                            selectSpecialize = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  SizedBox(height: 10,),
                                  defaultText(
                                      text: 'Price',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  defaultTextFormField(
                                    hint: 'Price',
                                    control: priceControlling,
                                    valdiate: (value) {
                                      if (value.isEmpty) {
                                        return 'enter the price';
                                      }
                                    },
                                    textInputType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultText(
                                      text: 'Info',
                                      bold: true,
                                      color: '#747f9e',
                                      size: 14.0,
                                      textAlign: TextAlign.start),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  defaultTextFormField(
                                    hint: 'Info',
                                    control: infoControlling,
                                    valdiate: (value) {
                                      if (value.isEmpty) {
                                        return 'enter some Info about info';
                                      }
                                    },
                                    textInputType: TextInputType.text,
                                  ),
                                  SizedBox(height: 20,),
                                  if(state is! AuthSignUpDoctorLoading)defaultAccessButton(
                                      text: 'SIGNUP',
                                      function: (){
                                        if(formkey.currentState!.validate()){
                                          AuthCubit.get(context).postSignUpDoctor(
                                              password: passwordControlling.text,
                                              info: infoControlling.text,
                                              specialize: selectSpecialize.toString(),
                                              price: priceControlling.text,
                                              dateofbirth: birthDateInString.toString(),
                                              gender: selectGender.toString(),
                                              username: nameControlling.text,
                                          );
                                        }
                                      }
                                  ),
                                  if(state is AuthSignUpDoctorLoading)Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator())
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/image/amr.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
