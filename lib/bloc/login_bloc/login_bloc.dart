import 'package:bloc/bloc.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_repository.dart';
import 'package:blocprovider_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../services/session-manager/session_controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
   on<EmailChanged>(_onEmailChanged);
   on<PasswordChanged>(_onPasswordChanged);
   on<LoginApi>(_onLoginApi);
  }
  void _onEmailChanged(EmailChanged event, Emitter<LoginStates>emit){
    print(event.email);
    emit(
      state.copyWith(email: event.email)
    );
  }
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates>emit){
    emit(
      state.copyWith(password: event.password)
    );
  }
  void _onLoginApi(LoginApi event, Emitter<LoginStates>emit)async{
    Map data = {"email":state.email,"password": state.password};
    //Map data = {"email": "eve.holt@reqres.in","password": "cityslicka"};
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading )
    );
    await loginRepository.loginApi(data).then((value) async{
      if(value.error.isNotEmpty){
        emit(
          state.copyWith(message: value.error.toString(),postApiStatus: PostApiStatus.error)
        );
      }else{
        await SessionController().saveUserInPerference(value);
        await SessionController().getUserFromPerference();
        emit(state.copyWith(message: 'Login Successfull',postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(message: error.toString(),postApiStatus: PostApiStatus.error),
      );
    });
  }
}

