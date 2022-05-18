abstract class AuthState{}
class AuthInitial extends AuthState{}
class AuthLoginLoading extends AuthState{}
class AuthLoginSuccess extends AuthState{}
class AuthLoginError extends AuthState{
  final error;
  AuthLoginError(this.error);
}
class AuthEmailValidLoading extends AuthState{}
class AuthEmailValidSuccess extends AuthState{}
class AuthEmailValidError extends AuthState{
  final error;
  AuthEmailValidError(this.error);
}
class AuthOtpValidLoading extends AuthState{}
class AuthOtpValidSuccess extends AuthState{}
class AuthOtpValidError extends AuthState{
  final error;
  AuthOtpValidError(this.error);
}
class AuthSignUpLoading extends AuthState{}
class AuthSignUpSuccess extends AuthState{}
class AuthSignUpError extends AuthState{
  final error;
  AuthSignUpError(this.error);
}
class AuthSignUpDoctorLoading extends AuthState{}
class AuthSignUpDoctorSuccess extends AuthState{}
class AuthSignUpDoctorError extends AuthState{
  final error;
  AuthSignUpDoctorError(this.error);
}