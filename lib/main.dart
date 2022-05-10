import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/cubit/cubit.dart';
import 'package:homeclinic/modules/view/main_screen/main_screen.dart';
import 'package:homeclinic/shared/local/shared.dart';
import 'package:homeclinic/shared/remote/dio.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.initail();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=> HomeClinicCubit()
            ..viewDoctorNeurologists(spec: 'neurologists')
            ..viewDoctorDentist(spec: 'dentist')
            ..viewDoctorInternalMedicine(spec: 'internal medicine')
            ..viewDoctorOphthalmologists(spec: 'Ophthalmologists')
            ..viewDoctorPediatricians(spec: 'pediatricians')
            ..viewDoctorOtolaryngologists(spec: 'otolaryngologists')
            ..viewDoctorDermatologists(spec: 'dermatologists')
            ..viewDoctorGynecologists(spec: 'gynecologists')
       )
      ],
      child: MaterialApp(
        title: 'Home Clinic',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}


