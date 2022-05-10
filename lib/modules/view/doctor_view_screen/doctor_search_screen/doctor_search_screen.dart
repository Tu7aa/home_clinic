import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';

class DoctorSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        title: 'Search',
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              defaultTextFormField(
                hint: 'search',
                textInputType: TextInputType.text,
                control: searchController,
                suffixIcon: Icon(Icons.search, color: HexColor('#23b2ff'),)
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  defaultSpecialties(
                    src: 'assets/image/Orthopodist.png',
                    name: 'Orthopodist',
                  ),
                  Spacer(),
                  defaultSpecialties(
                    src: 'assets/image/Surgeon.png',
                    name: 'Surgeon',
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  defaultSpecialties(
                    src: 'assets/image/Dentist.png',
                    name: 'Dentist',
                  ),
                  Spacer(),
                  defaultSpecialties(
                    src: 'assets/image/Orthopodist2.png',
                    name: 'Orthopodist',
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  defaultSpecialties(
                    src: 'assets/image/Orthopodist3.png',
                    name: 'Orthopodist',
                  ),
                ],
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
Widget defaultSpecialties({src, name})=> Container(
  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
  child: Row(
    children: [
      Text(name),
      SizedBox(width: 5,),
      Image.asset(src, width: 30, height: 30,)
    ],
  ),
);
