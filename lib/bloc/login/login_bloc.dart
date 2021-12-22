import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otto_wilde_recipies/bloc/login/login_event.dart';
import 'package:otto_wilde_recipies/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);


  LoginState get initialState => LoginState.empty();

  Stream<LoginState> mapEventToState(LoginEvent event)async*{
      if(event is EmailChanged){
        yield* _mapEmailChangedToState(event.email);
      }else if(event is PasswordChanged){
        yield* _mapPasswordChangedToState(event.password);
      }else if(event is LoginWithCredentialsPressed){
        yield* _mapLoginWithCredentialsPressedToState(email: event.email);
      }
  }

  Stream<LoginState> _mapEmailChangedToState(String email)async*{
    yield state.update();
  }

  Stream<LoginState> _mapPasswordChangedToState(String password)async*{
    yield state.update();
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({String? email})async*{
   try{
     yield LoginState.loading();
     //_userRepository?.signInWithEmail(email: email,context: context);
     yield LoginState.success();
   }catch(_){

   }
  }

}
