import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/core/widgets/custom_text_form.dart';
import 'package:session/feature/auth/view/register_screen.dart';

import '../../home/view/home_screen.dart';
import '../view_,model/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    builder: (context) => const HomeScreen(),
                  ));
            }
          },
          builder: (context, state) {
            AuthCubit myCubit = AuthCubit().get(context);
            return SafeArea(
              child: Column(
                children: [
                  CustomTextForm(
                      controller: myCubit.emailEt,
                      title: "email",
                      hint: "enter your email"),
                  CustomTextForm(
                      controller: myCubit.passwordEt,
                      title: "Password",
                      hint: "enter your Password"),
                  ElevatedButton(
                      onPressed: () {
                        myCubit.login();
                      },
                      child: state is AuthLoading
                          ? const CupertinoActivityIndicator()
                          : const Text("Login")),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      child: Text("Register"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
