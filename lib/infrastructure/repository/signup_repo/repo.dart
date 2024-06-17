import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/signup_models/models.dart';

class SignUpRepo {
  Future<String> signupReq(SignUpModels user) async {
    Map<String, dynamic> requestData = {
      "name": user.name,
      "mobileNo": user.mobileNo,
      "currency": user.currency,
      "email": user.email,
      "address": user.address,
      "password": user.password,
      "role": user.role
    };
    try {
      final response = await http.post(
        Uri.parse(Api.signUpApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['success'] == false) {
          return responseBody['msg'];
        } else {
          return 'Success';
        }
      } else {
        return ' Registration Faild';
      }
    } catch (e) {
      return "Some Error Occurs";
    }
  }
}
