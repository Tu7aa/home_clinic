import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/main_screen/home_screen/home_screen.dart';
import 'package:homeclinic/shared/components.dart';

class ChatScreen extends StatelessWidget {
  List chat = [
    {
      'id': 0,'name': 'Noha', 'image': 'assets/image/doctor.png',
    'message' : 'How would you like us to advise about your health?'
    },
    {'id': 1,'name': 'Mona', 'image': 'assets/image/doctor.png',
      'message' : 'How would you like us to advise about your health?'
    },
    {'id': 2,'name': 'Abeer', 'image': 'assets/image/doctor.png',
      'message' : 'How would you like us to advise about your health?'
    },
    {'id': 3,'name': 'Yara', 'image': 'assets/image/doctor.png',
      'message' : 'How would you like us to advise about your health?'
    },
  ];
  var searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          defaultAppBarIcons(icon: Icons.person_add_alt_1_sharp),
        ],
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10 ),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/image/amr.jpeg'),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: defaultText(text: 'Chat', color: '#262c3d', bold: true, size: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: HexColor('#F9F9F9'),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        controller: searchControl,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: HexColor('#23b2ff')),
                  ])),
              SizedBox(height: 10,),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    reverse: false,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index)=> defaultcontainer(chat[index]),
                    separatorBuilder: (context, index)=> SizedBox(height: 15),
                    itemCount: chat.length
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget defaultcontainer(chat)=> Container(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(
              0, 3), // changes position of shadow
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0)
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3)
                )
              ]
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('assets/image/amr.jpeg', height: 90, width: 90, fit: BoxFit.cover,))),
      SizedBox(width: 10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text('Dr. ${chat['name']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HexColor('#262c3d')),
              maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Text('${chat['message']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HexColor('#b0b3c7')),
            maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )
    ],
  ),
);
