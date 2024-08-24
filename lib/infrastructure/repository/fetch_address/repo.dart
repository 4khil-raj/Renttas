import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/fetch_address/model.dart';

class AddressRepository {
  fetchAddresses() async {
    List<FetchAddressModel> addressList = [];
    Map<String, dynamic> req = {
      "selectedPropertyId": currentPropertyId,
      "selectedSubPropertyId": currentSubpropertyId
    };
    final response = await http.post(
      Uri.parse(Api.getAddressDetails),
      body: jsonEncode(req),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Faild to load');
    }
  }
}
