import 'package:blocprovider_clean_coding/bloc/login_bloc/login_bloc.dart';
import 'package:blocprovider_clean_coding/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          elevation: 20,
          shadowColor: Colors.deepPurple[600],
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(20))),
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Email';
              }
              if(!Validations.emailValidator(value)){
                return 'Enter A Valid Email Address';
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
