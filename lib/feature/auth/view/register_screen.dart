import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/core/widgets/custom_text_form.dart';
import 'package:session/feature/auth/view_,model/auth_cubit.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            }
          },
          builder: (context, state) {
            AuthCubit myCubit = AuthCubit().get(context);
            return SafeArea(
              child: Column(
                children: [
                  CustomTextForm(
                      controller: myCubit.nameEt,
                      title: "Name",
                      hint: "enter your name"),
                  CustomTextForm(
                      controller: myCubit.emailEt,
                      title: "email",
                      hint: "enter your email"),
                  CustomTextForm(
                      controller: myCubit.passwordEt,
                      title: "Password",
                      hint: "enter your Password"),
                  CustomTextForm(
                      controller: myCubit.phoneEt,
                      title: "phone",
                      hint: "enter your phone"),
                  ElevatedButton(
                      onPressed: () {
                        myCubit.registerUser();
                      },
                      child: state is AuthLoading
                          ? CupertinoActivityIndicator()
                          : Text("Register"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
