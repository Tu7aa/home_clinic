import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeclinic/modules/view/doctor_view_screen/doctor_view_screen.dart';
import 'package:homeclinic/modules/view/main_screen/chat_screen/chat_screen.dart';
import 'package:homeclinic/modules/view/main_screen/cubit/states.dart';
import 'package:homeclinic/modules/view/main_screen/home_screen/home_screen.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/profile_screen.dart';
import 'package:homeclinic/modules/view/main_screen/schedule_screen/schedule_screen.dart';

class MainScreenCubit extends Cubit<MainScreenStates>{
  MainScreenCubit() : super(MainScreenInitial());
  static MainScreenCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  var widget = [
    HomeScreen(),
    ScheduleScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  void changeIndex(index){
    currentIndex = index;
    emit(MainScreenChangeIndex());
  }
}