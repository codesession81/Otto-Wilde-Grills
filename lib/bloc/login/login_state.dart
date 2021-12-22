import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

 const LoginState({
   required this.isEmailValid,
   required this.isPasswordValid,
   required this.isSubmitting,
   required this.isSuccess,
   required this.isFailure
 });

 //Initial state
 factory LoginState.empty(){
   return const LoginState(
     isEmailValid: true,
     isPasswordValid: true,
     isSubmitting: false,
     isFailure: false,
     isSuccess: false
   );
 }

  //Loading state
  factory LoginState.loading(){
    return const LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isFailure: false,
        isSuccess: false
    );
  }

  //Failure state
  factory LoginState.failure(){
    return const LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isFailure: true,
        isSuccess: false
    );
  }

  //Success state
  factory LoginState.success(){
    return const LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isFailure: false,
        isSuccess: true
    );
  }

  LoginState update({
    final bool? isEmailValid,
    final bool? isPasswordValid
  }){
   return copyWith(
       isEmailValid: isEmailValid,
       isPasswordValid: isPasswordValid,
       isSubmitting: false,
       isFailure: false,
       isSuccess: true
   );
  }

  LoginState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitEnabled,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure
  }){
   return LoginState(
     isEmailValid: isEmailValid ?? this.isEmailValid,
     isPasswordValid: isPasswordValid ?? this.isPasswordValid,
     isSubmitting: isSubmitting ?? this.isPasswordValid,
     isSuccess: isSuccess ?? this.isSuccess,
     isFailure: isFailure ?? this.isFailure
   );
  }

}