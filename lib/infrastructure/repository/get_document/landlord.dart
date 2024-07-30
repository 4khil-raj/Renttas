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
        print(responseBody);

        if (responseBody['data'] != null) {
          print("==============741596");
          list = GetDocumentModel.fromJsonList(responseBody['data']);
        }
      } else {
        print(
            'Failed to fetch documents with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }

    return list;
  }
}
