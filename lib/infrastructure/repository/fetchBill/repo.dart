import 'dart:convert';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/bill_fetch/model.dart';
import 'package:http/http.dart' as http;

class FetchBillRepo {
  static Future<List<PropertyBillFetchModel>> billFetch(
      String propertyId, String subPropertyId) async {
    Map<String, dynamic> request = {
      "propertyId": propertyId,
      "subPropertyId": subPropertyId
    };
    List<PropertyBillFetchModel> billList = [];
    try {
      final response = await http.post(
        Uri.parse(Api.propertyBillFetch),
        body: json.encode(request),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['statuscode'] == 200 && responseBody["data"] is List) {
          billList = (responseBody['data'] as List).map((item) {
            return PropertyBillFetchModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        }
        return billList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
