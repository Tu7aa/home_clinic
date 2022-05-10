import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';

class HealthProfileScreen extends StatefulWidget {
  @override
  State<HealthProfileScreen> createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
  var heightControlling = TextEditingController();
  var weightControlling = TextEditingController();
  String? selectGender;
  String? selectBlood;
  String? birthDateInString;
  DateTime? birthDate;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: defaultAppBar(
            title: 'Create A Health Profile',
            action: false,
            leading: true,
            blue: true,
            leadingIcon: Icons.arrow_back_ios_sharp,
            leadingFunction: (){
              Navigator.pop(context);
            }
        ),
        body: SingleChildScrollView(
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
                            // control: passwordController,
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
                           Row(
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     defaultText(
                                       text: 'Height (cm)',
                                       color: '#747f9e',
                                       size: 14.0,
                                       bold: true,
                                     ),
                                     SizedBox(height: 5,),
                                     defaultTextFormField(
                                       textInputType: TextInputType.number,
                                       hint: '150',
                                       control: heightControlling,
                                       valdiate: (String? value){
                                         if(value!.isEmpty){
                                           return 'Please Enter Your Height';
                                         }
                                       }
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(width: 10,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     defaultText(
                                       text: 'Weight (kg)',
                                       color: '#747f9e',
                                       size: 14.0,
                                       bold: true,
                                     ),
                                     SizedBox(height: 5,),
                                     defaultTextFormField(
                                         textInputType: TextInputType.number,
                                         hint: '80',
                                         control: weightControlling ,
                                         valdiate: (String? value){
                                           if(value!.isEmpty){
                                             return 'Please Enter Your Weight';
                                           }
                                         }
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ) ,
                          SizedBox(
                            height: 10,
                          ),
                          defaultText(
                              text: 'Blood group',
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
                                value: selectBlood,
                                hint: defaultText(
                                    text: 'Blood',
                                    bold: true,
                                    size: 14.0,
                                    color: '#b0b3c7'
                                ),
                                items: <String>['O', 'B', 'B-', 'A', 'A+', 'A-'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value){
                                  setState(() {
                                    selectBlood = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          defaultAccessButton(
                              text: 'Create profile',
                              function: (){}
                          )
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
        ));
  }
}
