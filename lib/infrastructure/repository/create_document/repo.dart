import 'dart:convert';

import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/create_document/model.dart';
import 'package:http/http.dart' as http;

class CreateDocumentRepo {
  static Future createDocument(CreateDocument model) async {
    Map<String, dynamic> req = {
      "file":
          "https://lh3.googleusercontent.com/a/ACg8ocK2G5pNx_l1JdHIXN9nC5ZpApj1ngGHaTmep9wRuANWNa99VEc=s96-c",
      "docname": model.docName,
      "doctype": "",
      "Propertyid": model.propertyID,
      "subPropertyid": model.subPropertyId,
      "mobileNumber": "file images"
    };

    try {
      final response =
          await http.post(Uri.parse(Api.createDocumet), body: json.encode(req));

      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }
}
