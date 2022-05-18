abstract class HomeClinicPatientStates{}
class HomeClinicInitial extends HomeClinicPatientStates{}

class ViewPatientProfileLoading extends HomeClinicPatientStates{}
class ViewPatientProfileSuccess extends HomeClinicPatientStates{}
class ViewPatientProfileError extends HomeClinicPatientStates{
  final error;
  ViewPatientProfileError({this.error});
}
class MakeAppointmentLoading extends HomeClinicPatientStates{}
class MakeAppointmentSuccess extends HomeClinicPatientStates{}
class MakeAppointmentError extends HomeClinicPatientStates{
  final error;
  MakeAppointmentError({this.error});
}