import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/get_bill_tenant/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';

class TenantBillsRepository {
  Future<List<FetchTenantBills>> fetchTenantBills() async {
    Map<String, dynamic> req = {"email": userModel?.email};

    try {
      final response = await http.post(
        Uri.parse(Api.getTenantBill),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];

        // Directly mapping JSON data to the list of FetchTenantBills objects
        List<FetchTenantBills> list =
            data.map((json) => FetchTenantBills.fromJson(json)).toList();

        return list;
      } else {
        throw Exception('Failed to load tenant bills');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
