import 'package:blocprovider_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:blocprovider_clean_coding/main.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
        elevation: 20,
        shadowColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(
                  height: 20,
                ),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                SizedBox(
                  height: 50,
                ),
                LoginButton(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
