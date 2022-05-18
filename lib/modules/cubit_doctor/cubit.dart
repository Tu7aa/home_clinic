import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/cubit_doctor/states.dart';
import 'package:homeclinic/shared/local/shared.dart';
import 'package:homeclinic/shared/remote/dio.dart';

class HomeClinicDoctorCubit extends Cubit<HomeClinicDoctorStates>{
  HomeClinicDoctorCubit() : super(HomeClinicInitial());
  static HomeClinicDoctorCubit get(context) => BlocProvider.of(context);

  List doctors =[] ;
 viewDoctors({spec}){
   emit(ViewDoctorsLoading());
   DioHelper.getData(
       url: 'category/',
       token: CashHelper.getData(key: 'token'),
       query: {
         'spec' : spec
       }
   ).then((value){
     emit(ViewDoctorsSuccess());
     doctors = value.data['data']['Doctors'];
   }).catchError((e){
     emit(ViewDoctorsError(error: e.toString()));
     print(e.toString());
   });
}
var doctorName;
 var doctorImage;
 var doctorPrice;
  var doctorInfo;
 List doctorComments = [];
  viewDoctorProfile({id}){
    emit(ViewDoctorProfileLoading());
    DioHelper.getData(
        url: 'action/pt/drs/$id/',
        token: CashHelper.getData(key: 'token'),
    ).then((value){
      emit(ViewDoctorProfileSuccess());
      doctorName = value.data['doctor'];
      doctorImage = value.data['ImageURL'];
      doctorInfo = value.data['info'];
      doctorComments = value.data['patients comments']['comments'];
      doctorPrice = value.data['price'];
    }).catchError((e){
      emit(ViewDoctorProfileError(error: e.toString()));
      print(e.toString());
    });
  }
  List clinic = [];
  viewDoctorClinic({id}){
    emit(ViewDoctorClinicLoading());
    DioHelper.getData(
      url: 'action/pt/drs/$id/clinics/',
      token: CashHelper.getData(key: 'token'),
    ).then((value){
      emit(ViewDoctorClinicSuccess());
      clinic = value.data['clinics'];
    }).catchError((e){
      emit(ViewDoctorClinicError(error: e.toString()));
      print(e.toString());
    });
  }
  searchDoctor({id}){
    emit(ViewDoctorClinicLoading());
    DioHelper.getData(
      url: 'action/pt/drs/$id/clinics/',
      token: CashHelper.getData(key: 'token'),
    ).then((value){
      emit(ViewDoctorClinicSuccess());
      clinic = value.data['clinics'];
    }).catchError((e){
      emit(ViewDoctorClinicError(error: e.toString()));
      print(e.toString());
    });
  }

  AddDoctorComment({comment, doctorId}){
    emit(AddDoctorCommentLoading());
    DioHelper.postData(
        url: 'action/pt/comment/create/',
        token: CashHelper.getData(key: 'token'),
        data: {
          'doctor' : doctorId,
          'comment' : comment,
        }
    ).then((value){
      emit(AddDoctorCommentSuccess());
    }).catchError((e){
      emit(AddDoctorCommentError(error: e.toString()));
      print(e.toString());
    });
  }

}
