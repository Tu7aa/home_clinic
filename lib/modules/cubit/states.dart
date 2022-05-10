abstract class HomeClinicStates{}
class HomeClinicInitial extends HomeClinicStates{}

class ViewDoctorNeurologistsLoading extends HomeClinicStates{}
class ViewDoctorNeurologistsSuccess extends HomeClinicStates{}
class ViewDoctorNeurologistsError extends HomeClinicStates{
  final error;
  ViewDoctorNeurologistsError({this.error});
}

class ViewDoctorDentistLoading extends HomeClinicStates{}
class ViewDoctorDentistSuccess extends HomeClinicStates{}
class ViewDoctorDentistError extends HomeClinicStates{
  final error;
  ViewDoctorDentistError({this.error});
}

class ViewDoctorInternalMedicineLoading extends HomeClinicStates{}
class ViewDoctorInternalMedicineSuccess extends HomeClinicStates{}
class ViewDoctorInternalMedicineError extends HomeClinicStates{
  final error;
  ViewDoctorInternalMedicineError({this.error});
}

class ViewDoctorOphthalmologistsLoading extends HomeClinicStates{}
class ViewDoctorOphthalmologistsSuccess extends HomeClinicStates{}
class ViewDoctorOphthalmologistsError extends HomeClinicStates{
  final error;
  ViewDoctorOphthalmologistsError({this.error});
}

class ViewDoctorPediatriciansLoading extends HomeClinicStates{}
class ViewDoctorPediatriciansSuccess extends HomeClinicStates{}
class ViewDoctorPediatriciansError extends HomeClinicStates{
  final error;
  ViewDoctorPediatriciansError({this.error});
}

class ViewDoctorOtolaryngologistsLoading extends HomeClinicStates{}
class ViewDoctorOtolaryngologistsSuccess extends HomeClinicStates{}
class ViewDoctorOtolaryngologistsError extends HomeClinicStates{
  final error;
  ViewDoctorOtolaryngologistsError({this.error});
}

class ViewDoctorDermatologistsLoading extends HomeClinicStates{}
class ViewDoctorDermatologistsSuccess extends HomeClinicStates{}
class ViewDoctorDermatologistsError extends HomeClinicStates{
  final error;
  ViewDoctorDermatologistsError({this.error});
}

class ViewDoctorGynecologistsLoading extends HomeClinicStates{}
class ViewDoctorGynecologistsSuccess extends HomeClinicStates{}
class ViewDoctorGynecologistsError extends HomeClinicStates{
  final error;
  ViewDoctorGynecologistsError({this.error});
}