part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable{
  const LoginEvents();
  @override
  List<Object> get props => [];
}
class EmailChanged extends LoginEvents{
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}
class EmailUnfocused extends LoginEvents{
  @override
  List<Object> get props => [];
}
class PasswordChanged extends LoginEvents{
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}
class PasswordUnfocused extends LoginEvents{
  @override
  List<Object> get props => [];
}
class LoginApi extends LoginEvents{
  @override
  List <Object> get props => [];
}