import 'dart:convert';

import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/fetch_expense/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:http/http.dart' as http;

class FetchExpenseRepo {
  static Future<List<FetchExpenseModel>> fetchExpense() async {
    Map<String, dynamic> req = {
      "landlordId": userModel!.uid,
      "propertyId": currentPropertyId,
      "subPropertyId": currentSubpropertyId
    };

    try {
      final response =
          await http.post(Uri.parse(Api.getExpense), body: jsonEncode(req));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final List<dynamic> data = responseBody['data'];

        List<FetchExpenseModel> expenses =
            data.map((item) => FetchExpenseModel.fromJson(item)).toList();
        return expenses;
      } else {
        throw Exception('Failed to load expenses');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
