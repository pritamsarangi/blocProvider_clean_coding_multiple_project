import 'package:blocprovider_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:blocprovider_clean_coding/config/routes/routes_name.dart';
import 'package:blocprovider_clean_coding/utils/enums.dart';
import 'package:blocprovider_clean_coding/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        // TODO: implement listener
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(state.message.toString(), context);
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushBarSuccessMessage(state.message.toString(), context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            style: ButtonStyle(elevation: MaterialStatePropertyAll(20)),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? CircularProgressIndicator()
                : const Text('Login'),
          );
        },
      ),
    );
  }
}
