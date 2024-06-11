// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/auth/sign_in/widgets/fields.dart';
import 'package:renttas/presentation/screens/auth/sign_up/sign_up.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/signup.png'),
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 80,
                backgroundColor: Color.fromARGB(255, 82, 144, 83),
                child: Icon(
                  // Icons.person,
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              SignInFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t Have An Account?'),
                  TextButton(
                    onPressed: () =>
                        customNavRemoveuntil(context, SignUpScreen()),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          decorationColor: Color.fromARGB(255, 255, 0, 0),
                          color: Color.fromARGB(255, 255, 0, 0),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
