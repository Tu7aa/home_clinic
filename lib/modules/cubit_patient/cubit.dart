import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/cubit_patient/states.dart';
import 'package:homeclinic/shared/local/shared.dart';
import 'package:homeclinic/shared/remote/dio.dart';

class HomeClinicPatientCubit extends Cubit<HomeClinicPatientStates> {
  HomeClinicPatientCubit() : super(HomeClinicInitial());
  static HomeClinicPatientCubit get(context) => BlocProvider.of(context);

  var token = CashHelper.getData(key: 'token');
  var patientName;
  var patientimage;
  var patientGender;
  var patientBirthDay;
  getprofile(){
    emit(ViewPatientProfileLoading());
    DioHelper.getData(
        url: 'profile/patient/',
        token: token,
    ).then((value){
      emit(ViewPatientProfileSuccess());
      patientName = value.data['username'];
      patientimage = value.data['ImageURL'];
      patientGender = value.data['info'][0]['gender'];
      patientBirthDay = value.data['info'][0]['dateofbirth'];
    }).catchError((e){
      emit(ViewPatientProfileError(error: e.toString()));
      print(e.toString());
    });
  }
  makeAppointment({clinicName, doctorName, date}){
    emit(MakeAppointmentLoading());
    DioHelper.postData(
      url: 'action/pt/reservation/create/',
      token: token,
      data: {
        'clinic' : clinicName,
        'doctor' : doctorName,
        'opptdate' : date
      }
    ).then((value){
      emit(MakeAppointmentSuccess());
    }).catchError((e){
      emit(MakeAppointmentError(error: e.toString()));
      print(e.toString());
    });
  }

}