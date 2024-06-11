import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/auth/sign_in/signin.dart';
import 'package:renttas/presentation/screens/auth/sign_up/widgets/fields.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              Text(
                'Sign Up',
                style: GoogleFonts.inter(
                    fontSize: 36, fontWeight: FontWeight.w800),
              ),
              const SignUpFields(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have An Account?'),
                  TextButton(
                    onPressed: () =>
                        customNavRemoveuntil(context, SignInScreen()),
                    child: const Text(
                      'Sign In',
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
