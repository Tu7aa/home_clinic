import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/auth/cubit/states.dart';
import 'package:homeclinic/shared/local/shared.dart';
import 'package:homeclinic/shared/remote/dio.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() :super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  postLogin({email, password}){
    emit(AuthLoginLoading());
    DioHelper.postData(
        url: 'login/',
        data:{
          'email':email,
          'password':password
        }
    ).then((value){
      emit(AuthLoginSuccess());
      CashHelper.setData(key: 'token', value: value.data['token']);
      print(value.data);
    }).catchError((e){
      emit(AuthLoginError(e.toString()));
      print(e.toString());
    });
  }
  postEmailValid({email}){
    emit(AuthEmailValidLoading());
    DioHelper.postData(
        url: 'verify_email/',
        data:{
          'email':email,
        }
    ).then((value){
      emit(AuthEmailValidSuccess());
      print(value.data);
    }).catchError((e){
      emit(AuthEmailValidError(e.toString()));
      print(e.toString());
    });
  }
  postVerify({otp}){
    emit(AuthOtpValidLoading());
    DioHelper.postData(
        url: 'verify_OTP/',
        data:{
          'otp':otp,
        }
    ).then((value){
      emit(AuthOtpValidSuccess());
      print(value.data);
    }).catchError((e){
      emit(AuthOtpValidError(e.toString()));
      print(e.toString());
    });
  }
  postSignUp({username,password,gender, city, dateofbirth, age, blood, info, heigh, weight}){
    emit(AuthSignUpLoading());
    DioHelper.postData(
        url: 'patient/SignUp/',
        data:{
          "username":username,
          "password":password,
          "info":info,
          "gender":gender,
          "city":city,
          "dateofbirth":dateofbirth,
          "age":age,
          "blood":blood,
          "heigh":heigh,
          "weight":weight
        }
    ).then((value){
      emit(AuthSignUpSuccess());
      print(value.data);
    }).catchError((e){
      emit(AuthSignUpError(e.toString()));
      print(e.toString());
    });
  }
  postSignUpDoctor({username,password,gender,info, dateofbirth, price, specialize}){
    emit(AuthSignUpDoctorLoading());
    DioHelper.postData(
        url: 'doctor/SignUp/',
        data:{
          "username":username,
          "password":password,
          "info": info,
          "gender":gender,
          "dateofbirth":dateofbirth,
          "specialize":specialize,
          "price":price,
        }
    ).then((value){
      emit(AuthSignUpDoctorSuccess());
      print(value.data);
    }).catchError((e){
      emit(AuthSignUpDoctorError(e.toString()));
      print(e.toString());
    });
  }
}