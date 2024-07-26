import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/fetch_address/model.dart';

class AddressRepository {
  Future<List<FetchAddressModel>> fetchAddresses() async {
    Map<String, dynamic> req = {
      "selectedPropertyId": "",
      "selectedSubPropertyId": ""
    };
    final response = await http.post(
      Uri.parse(Api.getAddressDetails),
      body: jsonEncode(req),
      headers: {
        'Content-Type': 'application/json'
      }, // Adding headers if required
    );
    print("++++++++++++++++++++++++++++=======");
    print(response.body);
    print("++++++++++++++++++++++++++++=======");
    print(currentPropertyId);
    print(currentSubpropertyId);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['data'] != null) {
        final List<dynamic> data = jsonResponse['data'];
        return data.map((json) => FetchAddressModel.fromJson(json)).toList();
      } else {
        return []; // Return an empty list if data is null
      }
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
