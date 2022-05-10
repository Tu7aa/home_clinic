import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';

class NewsDetailsScreen extends StatefulWidget {
  String? title;
  String? body;
  NewsDetailsScreen({this.title, this.body});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool maxText = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80.0),
                    bottomLeft: Radius.circular(80.0)),
                child: Image.asset('assets/image/slider.png', fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 16,
                                color: HexColor('#23b2ff'),
                              ),
                              onPressed: (){Navigator.pop(context);}
                          )),
                      Spacer(),
                      Text(
                      'News',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                          height: 40,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: IconButton(
                            icon: Icon(
                              Icons.share,
                              color: HexColor('#23b2ff'),
                            ),
                            onPressed: (){},
                          ))
                    ],
                  ),
                  SizedBox(height: height * 0.23,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.title}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: HexColor('#262c3d'), fontSize: 20.0, fontWeight: FontWeight.bold) ,
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_sharp,
                                    color: HexColor('#23b2ff'),
                                    size: 14,
                                  ),
                                  Text('22/4/2022',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('#b0b3c7'))),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text(
                                '${widget.body}',
                                maxLines: (maxText == false) ? 7 : 100,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: HexColor('#747f9e'), fontSize: 14.0, fontWeight: FontWeight.bold) ,
                              ),
                            ],
                          ),
                        ),
                        if(maxText == false)TextButton(onPressed: (){
                          setState(() {
                            maxText = !maxText;
                          });
                        }, child: Text(
                          'more',
                          style: TextStyle(color: HexColor('#23b2ff'), fontSize: 14),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
