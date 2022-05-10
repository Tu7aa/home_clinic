import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/cubit/states.dart';
import 'package:homeclinic/shared/remote/dio.dart';

class HomeClinicCubit extends Cubit<HomeClinicStates>{
  HomeClinicCubit() : super(HomeClinicInitial());
  static HomeClinicCubit get(context) => BlocProvider.of(context);

  List doctorNeurologists = [];
 viewDoctorNeurologists({spec}){
   emit(ViewDoctorNeurologistsLoading());
   DioHelper.getData(
       url: 'category/',
       // token: '7a556c3e80f3818e6ab5803dab6796a0ebc104a8',
       query: {
         'spec' : spec
       }
   ).then((value){
     emit(ViewDoctorNeurologistsSuccess());
     doctorNeurologists = value.data['Doctors'];
   }).catchError((e){
     emit(ViewDoctorNeurologistsError(error: e.toString()));
     print(e.toString());
   });
}
  List doctorDentist = [];
  viewDoctorDentist({spec}){
    emit(ViewDoctorDentistLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorDentistSuccess());
      doctorDentist = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorDentistError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorInternalMedicine = [];
  viewDoctorInternalMedicine({spec}){
    emit(ViewDoctorInternalMedicineLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorInternalMedicineSuccess());
      doctorInternalMedicine = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorInternalMedicineError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorOphthalmologists = [];
  viewDoctorOphthalmologists({spec}){
    emit(ViewDoctorOphthalmologistsLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorOphthalmologistsSuccess());
      doctorOphthalmologists = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorOphthalmologistsError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorPediatricians = [];
  viewDoctorPediatricians({spec}){
    emit(ViewDoctorPediatriciansLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorPediatriciansSuccess());
      doctorPediatricians = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorPediatriciansError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorOtolaryngologists = [];
  viewDoctorOtolaryngologists({spec}){
    emit(ViewDoctorOtolaryngologistsLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorOtolaryngologistsSuccess());
      doctorOtolaryngologists = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorOtolaryngologistsError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorDermatologists = [];
  viewDoctorDermatologists({spec}){
    emit(ViewDoctorDermatologistsLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorDermatologistsSuccess());
      doctorDermatologists = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorDermatologistsError(error: e.toString()));
      print(e.toString());
    });
  }
  List doctorGynecologists = [];
  viewDoctorGynecologists({spec}){
    emit(ViewDoctorGynecologistsLoading());
    DioHelper.getData(
        url: 'category/',
        query: {
          'spec' : spec
        }
    ).then((value){
      emit(ViewDoctorGynecologistsSuccess());
      doctorGynecologists = value.data['Doctors'];
    }).catchError((e){
      emit(ViewDoctorGynecologistsError(error: e.toString()));
      print(e.toString());
    });
  }
}
