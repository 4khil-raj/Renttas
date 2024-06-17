import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';

class ForgetPasswordRepo {
  Future<String> forgetpassword(String email) async {
    Map<String, dynamic> requestData = {"email": email};
    try {
      final response = await http.post(
        Uri.parse(Api.forgetPasswordApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody['otp'];
      } else {
        return 'email not found';
      }
    } catch (e) {
      return '';
    }
  }
}
