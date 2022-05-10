import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/main_screen/news_screen/news_details_screen/news_details_screen.dart';
import 'package:homeclinic/shared/components.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin{
  List<dynamic> photo = [
    {
      'image' : 'assets/image/slider.png',
    },
    {
      'image' : 'assets/image/slider2.jpg',
    },
    {
      'image' : 'assets/image/slider3.jpg',
    },
  ];

  List<dynamic> news = [
    {
      'title' : 'COVID-19 Case',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'Egypt reports 882 new',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'COVID-19 daily briefing',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'Egypt reports 882 new',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'COVID-19 daily briefing',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'Egypt reports 882 new',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
    {
      'title' : 'COVID-19 daily briefing',
      'description' : 'COVID-19 changed the face of the healthcare industry. For many months, the hospitals were always short of human resources and overloaded due to the influx of patients. To help limit visibility and channel resources, many private operations were forced to '
    },
  ];
  bool search = false;
  var searchController = TextEditingController();
  late TabController tabController;
  void initState() {
    tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: tabController.index,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(
          action: true,
          leading: true,
          title: 'News',
          leadingIcon: Icons.arrow_back_ios_sharp,
          leadingFunction: (){
            Navigator.pop(context);
          },
          actionIcon: Icons.search,
          actionFunction: (){
            setState(() {
              search = !search;
            });
          },
         bottom : TabBar(
            isScrollable: true,
            onTap: (void index) {
              setState(() {});
            },
            controller: tabController,
            tabs: <Widget>[
              Tab(
                  child: Text(
                    'All',
                    style: TextStyle(
                        color: (tabController.index == 0)
                            ? HexColor('#23b2ff')
                            : HexColor('#b0b3c7')),
                  )),
              Tab(
                child: Text(
                  'Health',
                  style: TextStyle(
                      color: (tabController.index == 1)
                          ? HexColor('#23b2ff')
                          : HexColor('#b0b3c7')),
                ),
              ),
              Tab(
                child: Text(
                  'News',
                  style: TextStyle(
                      color: (tabController.index == 2)
                          ? HexColor('#23b2ff')
                          : HexColor('#b0b3c7')),
                ),
              ),
              Tab(
                child: Text(
                  'Cancer',
                  style: TextStyle(
                      color: (tabController.index == 3)
                          ? HexColor('#23b2ff')
                          : HexColor('#b0b3c7')),
                ),
              ),
              Tab(
                child: Text(
                  'Medical',
                  style: TextStyle(
                      color: (tabController.index == 4)
                          ? HexColor('#23b2ff')
                          : HexColor('#b0b3c7')),
                ),
              ),
              Tab(
                child: Text(
                  'Live',
                  style: TextStyle(
                      color: (tabController.index == 5)
                          ? HexColor('#23b2ff')
                          : HexColor('#b0b3c7')),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(search == true) Column(
                  children: [
                    defaultTextFormField(
                      hint: 'search',
                      textInputType: TextInputType.text,
                      control: searchController,
                      suffixIcon: Icon(Icons.search, color: HexColor('#23b2ff'),)
                  ),
                    SizedBox(height: 15,),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CarouselSlider(
                    items: photo.map((e) => Builder(builder: (context) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: HexColor('#00AEAC'),
                                    spreadRadius: 0,
                                    blurRadius: 0),
                              ],
                            ),
                            child: Image.asset('${e['image']}',fit: BoxFit.cover, width: double.infinity,)
                        );
                      }),
                    )
                        .toList(),
                    options: CarouselOptions(
                      // autoPlayCurve: Curves.easeInCirc,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 1200),
                      reverse: false,
                      viewportFraction: 1,
                      aspectRatio: 2,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                defaultText(
                  text: 'Trending',
                  size: 18.0,
                  color: '#262c3d',
                  bold: true
                ),
                SizedBox(height: 15,),
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                      reverse: false,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index)=> defaultcontainer(news[index], context),
                      separatorBuilder: (context, index)=> SizedBox(height: 10),
                      itemCount: news.length
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget defaultcontainer(news, context) => InkWell(
  onTap: (){
    defaultNavigateTo(context: context, screen: NewsDetailsScreen(
      title: '${news['title']}',
      body: '${news['description']}',
    ));
  },
  child: Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
    child: Row(
      children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/image/slider.png',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ))),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${news['title']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#262c3d')),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${news['description']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#b0b3c7')),
              ),
              SizedBox(
                height: 10,
              ),
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
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding:
                    EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    color: HexColor('#d4faff'),
                    child: Text('News',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#2ad3e7'))),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  ),
);
