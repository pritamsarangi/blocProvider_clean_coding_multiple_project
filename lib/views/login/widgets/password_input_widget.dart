import 'package:blocprovider_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.password != previous.password,
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          elevation: 20,
          shadowColor: Colors.deepPurple[600],
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            focusNode: passwordFocusNode,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(20))),
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Password';
              }if(value.length < 6){
                return 'Please Enter Password Greater Than 6 Character';
              }
              return null;
            },
            onFieldSubmitted: (value) {},
          ),
        );
      },
    );
  }
}
