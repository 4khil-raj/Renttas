// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/user_type/type.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:renttas/presentation/widgets/form_field/form_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({super.key});

  @override
  State<SignUpFields> createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  dynamic phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[50]),
                  child: CustomTextFormField(
                    hintText: 'First Name',
                    controller: firstNameController,
                    labelText: 'First Name',
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[50]),
                  child: CustomTextFormField(
                    hintText: 'First Name',
                    controller: lastNameController,
                    labelText: 'First Name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            decoration: InputDecoration(
              fillColor: Colors.red[50], // Set your desired color here
              filled: true,
              hintText: 'Phone Number',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(),
              ),
              prefixIcon: Text('+'),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              setState(() {
                phonecontroller = phone.completeNumber;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              obscureText: false,
              labelText: 'Password',
              controller: passwordController,
              hintText: '*******',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red[50]),
            child: CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.black,
              ),
              obscureText: false,
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Color.fromARGB(255, 73, 148, 74),
              color: Color.fromARGB(255, 82, 144, 83),
              fontweight: FontWeight.w500,
              height: 60,
              name: 'Create Your Account',
              onTap: () => customNavPush(context, UserTypeScreen()),
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
