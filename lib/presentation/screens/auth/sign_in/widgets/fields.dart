// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/user_type/type.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class SignInFields extends StatelessWidget {
  SignInFields(
      {required this.emailController,
      required this.passwordController,
      super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Sign In',
            style: GoogleFonts.inter(fontSize: 34, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber[50]),
            child: CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber[50]),
            child: CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              obscureText: false,
              hintText: '*********',
              controller: emailController,
              labelText: 'Password',
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forget Your Password?',
                style: TextStyle(
                    decorationColor: Color.fromARGB(255, 0, 0, 0),
                    color: Color.fromARGB(255, 0, 0, 0),
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Color.fromARGB(255, 76, 135, 77),
              color: Color.fromARGB(255, 82, 144, 83),
              fontweight: FontWeight.w500,
              height: 60,
              name: 'Sign In',
              onTap: () {},
              radius: 30,
              textclr: Colors.black,
              textsize: 20,
            ),
          )
        ],
      ),
    );
  }
}
