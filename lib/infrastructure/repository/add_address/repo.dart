import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/fetch_address/fetchaddress_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class AddAddressRepo {
  static addAddress(
      {required String address,
      required String pincode,
      required context}) async {
    Map<String, dynamic> add = {
      "address": address,
      "pincode": pincode,
      "selectedPropertyId": currentPropertyId,
      "selectedSubPropertyId": currentSubpropertyId
    };

    try {
      final response = await http.post(Uri.parse(Api.addAddressDetails),
          body: jsonEncode(add));
      if (response.statusCode == 200) {
        Navigator.pop(context);
        BlocProvider.of<FetchaddressBloc>(context).add(FetchAddressReq());
      } else {
        alerts(context, "Try Again");
      }
    } catch (e) {
      alerts(context, e.toString());
    }
  }
}
