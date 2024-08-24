import 'dart:convert';
import 'package:renttas/core/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/domain/models/getTenant/models.dart';

class GetTenantRepo {
  static Future<List<GetTenantModel>> getTenantReq(
      String propertyId, String subPropertyId) async {
    Map<String, dynamic> req = {
      "subPropertyId": subPropertyId,
      "propertyId": propertyId
    };
    List<GetTenantModel> tenantList = [];

    try {
      final response = await http.post(
        Uri.parse(Api.getTenant),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(req),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['statuscode'] == 200 && responseBody['data'] is List) {
          tenantList = (responseBody['data'] as List).map((item) {
            return GetTenantModel.fromMap(item as Map<String, dynamic>);
          }).toList();
        } else {}
        return tenantList;
      } else {
        throw Exception('Failed to load tenants');
      }
    } catch (e) {
      throw Exception('Failed to load tenants');
    }
  }
}
//ini bloc create cheyth ithine emit cheyyippicha mathi pinne splashil ninnu ithine kalayanam
