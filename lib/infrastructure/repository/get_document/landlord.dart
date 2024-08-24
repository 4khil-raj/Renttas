import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/get_document/landlord.dart';

class GetDocumentLandlord {
  static Future<List<GetDocumentModel>> getDoc() async {
    List<GetDocumentModel> list = [];
    Map<String, dynamic> req = {
      "propertyId": currentPropertyId,
      "subPropertyId": currentSubpropertyId
    };

    try {
      final response = await http.post(
        Uri.parse(Api.getDocuments),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['data'] != null) {
          list = GetDocumentModel.fromJsonList(responseBody['data']);
        }
      } else {
        throw Exception('try again');
      }
    } catch (e) {
      throw Exception(e.toString());
    }

    return list;
  }
}
