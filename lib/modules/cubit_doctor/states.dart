abstract class HomeClinicDoctorStates{}
class HomeClinicInitial extends HomeClinicDoctorStates{}

class ViewDoctorsLoading extends HomeClinicDoctorStates{}
class ViewDoctorsSuccess extends HomeClinicDoctorStates{}
class ViewDoctorsError extends HomeClinicDoctorStates{
  final error;
  ViewDoctorsError({this.error});
}
class ViewDoctorProfileLoading extends HomeClinicDoctorStates{}
class ViewDoctorProfileSuccess extends HomeClinicDoctorStates{}
class ViewDoctorProfileError extends HomeClinicDoctorStates{
  final error;
  ViewDoctorProfileError({this.error});
}
class ViewDoctorClinicLoading extends HomeClinicDoctorStates{}
class ViewDoctorClinicSuccess extends HomeClinicDoctorStates{}
class ViewDoctorClinicError extends HomeClinicDoctorStates{
  final error;
  ViewDoctorClinicError({this.error});
}
class SearchDoctorLoading extends HomeClinicDoctorStates{}
class SearchDoctorSuccess extends HomeClinicDoctorStates{}
class SearchDoctorError extends HomeClinicDoctorStates{
  final error;
  SearchDoctorError({this.error});
}
class AddDoctorCommentLoading extends HomeClinicDoctorStates{}
class AddDoctorCommentSuccess extends HomeClinicDoctorStates{}
class AddDoctorCommentError extends HomeClinicDoctorStates{
  final error;
  AddDoctorCommentError({this.error});
}
