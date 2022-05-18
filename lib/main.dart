import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/auth/login/login_screen.dart';
import 'package:homeclinic/modules/auth/register/signup_doctor.dart';
import 'package:homeclinic/modules/cubit_doctor/cubit.dart';
import 'package:homeclinic/modules/cubit_patient/cubit.dart';
import 'package:homeclinic/modules/view/main_screen/main_screen.dart';
import 'package:homeclinic/shared/local/shared.dart';
import 'package:homeclinic/shared/remote/dio.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.initail();
  late String? token = CashHelper.getData(key: 'token');
  runApp( MyApp(token: token,));

}
class MyApp extends StatelessWidget {
  var token;
  MyApp({this.token});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=> HomeClinicPatientCubit()..getprofile()
        )
      ],
      child: MaterialApp(
        title: 'Home Clinic',
        debugShowCheckedModeBanner: false,
        home: (token != null) ? MainScreen() : LoginScreen(),
      ),
    );
  }
}


