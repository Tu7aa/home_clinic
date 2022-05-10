import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/check_up_screen/check_up_screen.dart';
import 'package:homeclinic/shared/components.dart';

class AddressLocationScreen extends StatefulWidget {
  String? date;
  String? time;
  String? doctorName;
  AddressLocationScreen({this.date, this.time, this.doctorName});
  @override
  State<AddressLocationScreen> createState() => _AddressLocationScreenState();
}

class _AddressLocationScreenState extends State<AddressLocationScreen> {
  String? selectCountry;
  String? selectCity;

  bool addressDefault = false;
  var addressStreetControlling = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        },
        title: 'Address Updates'
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultText(
                  text: 'Specific address',
                  bold: true,
                  size: 14.0,
                  color: '#747f9e'
                ),
                SizedBox(height: 10,),
                defaultTextFormField(
                  control: addressStreetControlling,
                  hint: '141 Mohamed Ali Square',
                  valdiate: (String? value){
                    if(value!.isEmpty){
                      return 'please Enter Your Address';
                    }
                  },
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15.0,),
                defaultText(
                    text: 'The provincial',
                    bold: true,
                    size: 14.0,
                    color: '#747f9e'
                ),
                SizedBox(height: 10,),
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
                      value: selectCountry,
                      hint: defaultText(
                          text: 'Area',
                          bold: true,
                          size: 14.0,
                          color: '#747f9e'
                      ),
                      items: <String>['Cairo', 'Giza', 'Domyat', 'Monufia', 'Mansoura', 'Tanta', 'Aswan'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          selectCountry = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                defaultText(
                    text: 'District',
                    bold: true,
                    size: 14.0,
                    color: '#747f9e'
                ),
                SizedBox(height: 10,),
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
                      value: selectCity,
                      hint: defaultText(
                          text: 'City',
                          bold: true,
                          size: 14.0,
                          color: '#747f9e'
                      ),
                      items: <String>['Elmarg', 'Madint Nasr', 'Shrouk', 'Abour', 'Masr Elgdida', 'New Cairo', 'Mounib'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          selectCity = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Checkbox(
                        value: addressDefault,
                        shape: CircleBorder(),
                        onChanged: (bool? value ){
                          setState(() {
                            addressDefault = value!;
                          });
                        },
                    ),
                    defaultText(
                        text: 'Select the address as default',
                        bold: true,
                        size: 14.0,
                        color: '#747f9e'
                    ),
                  ],
                ),
                SizedBox(height: 80,),
                defaultAccessButton(
                  text: 'Address updates',
                  function: (){
                    defaultNavigateTo(context: context, screen: CheckUpScreen(address: addressStreetControlling.text, date: widget.date, time: widget.time, doctorName: widget.doctorName ,));
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
