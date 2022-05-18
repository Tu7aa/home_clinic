import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/cubit_doctor/cubit.dart';
import 'package:homeclinic/modules/cubit_doctor/states.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/select_hospital_screen/select_hospital_screen.dart';
import 'package:homeclinic/shared/components.dart';

class DoctorInformationScreen extends StatefulWidget {
  String? doctorName;
  var doctorImage;
  var doctorId;

  DoctorInformationScreen({this.doctorName, this.doctorId, this.doctorImage});

  @override
  State<DoctorInformationScreen> createState() => _DoctorInformationScreenState();
}

class _DoctorInformationScreenState extends State<DoctorInformationScreen> {
  bool thanksSpecial = false;
  bool reviewSpecial = false;
  bool thanksDoctor = false;
  bool reviewDoctor = false;
  bool comment = false;
  var commentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(create: (context)=> HomeClinicDoctorCubit()..viewDoctorProfile(id: widget.doctorId),
     child: BlocConsumer<HomeClinicDoctorCubit, HomeClinicDoctorStates>(
       listener: (context, state){
         if(state is AddDoctorCommentSuccess){
           Navigator.pop(context);
           Fluttertoast.showToast(
               msg: "Add Comment Successfully",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.green,
               textColor: Colors.white,
               fontSize: 16.0
           );
           HomeClinicDoctorCubit.get(context).viewDoctorProfile(id: widget.doctorId);
         }
         if(state is AddDoctorCommentError){
           Fluttertoast.showToast(
               msg: "You Cannot Enter a Message more than once",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.green,
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
               leading: true,
               title: 'Doctor Information',
               leadingIcon: Icons.arrow_back_ios_sharp,
               leadingFunction: () {
                 Navigator.pop(context);
               }),
           body: SingleChildScrollView(
               child: Form(
                 key: formKey,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(25),
                             boxShadow: [
                               BoxShadow(
                                   color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                                   spreadRadius: 5,
                                   blurRadius: 7,
                                   offset: Offset(0, 3))
                             ]),
                         padding: EdgeInsets.only(top: 15, bottom: 15, right: 0, left: 20),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 (widget.doctorImage != 'User has No Profile Pic') ? Image.network(
                                   '${widget.doctorImage}',
                                   height: 60,
                                   width: 60,
                                 ) : CircleAvatar(
                                   backgroundColor: Colors.blue,
                                   radius: 45,
                                 ),
                                 SizedBox(
                                   width: 10,
                                 ),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     defaultText(
                                         text: '${widget.doctorName}',
                                         color: '#262c3d',
                                         size: 18.0,
                                         textAlign: TextAlign.start,
                                         bold: true),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.star,
                                           color: HexColor('#ffc107'),
                                           size: 14,
                                         ),
                                         Text('4.5(123)',
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.bold,
                                                 color: HexColor('#747f9e'))),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.person,
                                           color: HexColor('#23b2ff'),
                                         ),
                                         Container(
                                           width: width * 0.44,
                                           child: Text(
                                               (HomeClinicDoctorCubit.get(context).doctorInfo!=null)?
                                               '${HomeClinicDoctorCubit.get(context).doctorInfo}' : '...',
                                             textAlign: TextAlign.start,
                                             style: TextStyle(
                                                 color: HexColor('#747f9e'),
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Padding(
                               padding: const EdgeInsets.only(right: 20),
                               child: Divider(
                                 height: 2,
                                 color: HexColor('#bde7ff'),
                               ),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Expanded(
                                   child: Container(
                                     child: Row(
                                       children: [
                                         InkWell(
                                           onTap: (){
                                             setState(() {
                                               reviewDoctor = !reviewDoctor;
                                             });
                                           } ,
                                           child: Container(
                                             alignment: Alignment.center,
                                             height: 35,
                                             width: 35,
                                             decoration: BoxDecoration(
                                                 color: HexColor('#d3efff'),
                                                 borderRadius: BorderRadius.circular(15.0)),
                                             child: Icon(
                                               (reviewDoctor == false) ? Icons.star_border_purple500_outlined : Icons.star_outlined,
                                               color: HexColor('#23b2ff'),
                                               size: 18,
                                             ),),
                                         ),
                                         SizedBox(
                                           width: 4,
                                         ),
                                         Text('Review')
                                       ],
                                     ),
                                   ),
                                 ),
                                 Expanded(
                                   child: Container(
                                     child: Row(
                                       children: [
                                         InkWell(
                                           onTap: (){
                                             setState(() {
                                               thanksDoctor = !thanksDoctor;
                                             });
                                           },
                                           child: Container(
                                             alignment: Alignment.center,
                                             height: 35,
                                             width: 35,
                                             decoration: BoxDecoration(
                                                 color: HexColor('#ffe2de'),
                                                 borderRadius: BorderRadius.circular(15.0)),
                                             child: Icon(
                                               (thanksDoctor == false) ? Icons.favorite_border : Icons.favorite,
                                               color: HexColor('#ff6f5b'),
                                               size: 18,
                                             ),),
                                         ),
                                         SizedBox(
                                           width: 4,
                                         ),
                                         Text('Thanks')
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Row(
                         children: [
                           defaultText(
                             size: 18.0,
                             text: 'Specialist',
                             bold: true,
                             color: '#262c3d',
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                         decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                                 color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                                 spreadRadius: 5,
                                 blurRadius: 7,
                                 offset: Offset(0, 3))
                           ],
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Expanded(
                               child: Container(
                                 child: Row(
                                   children: [
                                     InkWell(
                                       onTap: (){
                                         setState(() {
                                           reviewSpecial = !reviewSpecial;
                                         });
                                       } ,
                                       child: Container(
                                           alignment: Alignment.center,
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(
                                               color: HexColor('#d3efff'),
                                               borderRadius: BorderRadius.circular(15.0)),
                                           child: Icon(
                                             (reviewSpecial == false) ? Icons.star_border_purple500_outlined : Icons.star_outlined,
                                             color: HexColor('#23b2ff'),
                                             size: 18,
                                           ),),
                                     ),
                                     SizedBox(
                                       width: 4,
                                     ),
                                     Text('Review')
                                   ],
                                 ),
                               ),
                             ),
                             Expanded(
                               child: Container(
                                 child: Row(
                                   children: [
                                     InkWell(
                                       onTap: (){
                                         setState(() {
                                           thanksSpecial = !thanksSpecial;
                                         });
                                       },
                                       child: Container(
                                           alignment: Alignment.center,
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(
                                               color: HexColor('#ffe2de'),
                                               borderRadius: BorderRadius.circular(15.0)),
                                           child: Icon(
                                             (thanksSpecial == false) ? Icons.favorite_border : Icons.favorite,
                                             color: HexColor('#ff6f5b'),
                                             size: 18,
                                           ),),
                                     ),
                                     SizedBox(
                                       width: 4,
                                     ),
                                     Text('Thanks')
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Row(
                         children: [
                           defaultText(
                             size: 18.0,
                             text: 'Reviews from users',
                             bold: true,
                             color: '#262c3d',
                           ),
                           Spacer(),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 comment = !comment;
                               });
                             },
                             child: Row(
                               children: [
                                 Icon((comment == false) ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp, color: HexColor('#23b2ff'),),
                                 SizedBox(width: 5,),
                                 defaultText(
                                   size: 12.0,
                                   text: 'Add Comment',
                                   bold: true,
                                   color: '#23b2ff',
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       if(comment == true)Container(
                         padding: EdgeInsets.symmetric(horizontal: 15),
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                             color: Colors.white,
                           border: Border.all(
                             color: HexColor('#b0b3c7')
                           )
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               child: TextFormField(
                                 validator: (String? value){
                                   if(value!.isEmpty){
                                     return 'Please Enter your Comment';
                                   }
                                 },
                                 autofocus: false,
                                 controller: commentController,
                                 keyboardType: TextInputType.text,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     hintText: 'Comment',
                                     hintStyle: TextStyle(color: HexColor('#b0b3c7')),
                                 ),
                               ),
                             ),
                             InkWell(
                               onTap: (){
                                if(formKey.currentState!.validate()){
                                  print('doctorId => ${widget.doctorId}');
                                  print('comment => ${commentController.text}');
                                  HomeClinicDoctorCubit.get(context).AddDoctorComment(
                                      doctorId: widget.doctorId,
                                      comment: commentController.text
                                  );
                                  commentController.clear();
                                  setState(() {
                                    comment = false;
                                  });
                                }
                               },
                               child: CircleAvatar(
                                 backgroundColor: HexColor('#23b2ff'),
                                 child: Icon(Icons.send, color: Colors.white,),
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Container(
                         child: ListView.separated(
                             shrinkWrap: true,
                             reverse: false,
                             physics: BouncingScrollPhysics(),
                             itemBuilder: (context, index) => defaultUserComment(HomeClinicDoctorCubit.get(context).doctorComments[index], width),
                             separatorBuilder: (context, index) => SizedBox(width: 0),
                             itemCount: HomeClinicDoctorCubit.get(context).doctorComments.length),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       defaultAccessButton(
                           text: 'Schedule a consultation', function: () {
                         defaultNavigateTo(context: context, screen: SelectHospitalScreen(doctorName: widget.doctorName,
                           id: widget.doctorId,doctorPrice: HomeClinicDoctorCubit.get(context).doctorPrice, doctorImage: widget.doctorImage,));
                       })
                     ],
                   ),
                 ),
               )),
         );

       },
     ),

    );
  }

}
Widget defaultUserComment(comment, width) => Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage('${comment['profile_pic']}'),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text((comment['user']!=null) ?'${comment['user']}' : '...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: HexColor('#ffc107'),
                    size: 14,
                  ),
                  Text('4.5',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#747f9e'))),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: width*0.630,
                child: Text((comment['comment'] != null)?'${comment['comment']}' : '...',
                maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
