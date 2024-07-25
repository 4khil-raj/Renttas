import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart%20';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import "package:http/http.dart" as http;

class UpdateTenantRepo {
  static updateTenant(AddTenantModel model, String id, context) async {
    print("ivite ethi");
    Map<String, dynamic> req = {
      "tenantid": id,
      "tenantName": model.tenantName,
      "phone": model.mobileNumber,
      "email": model.tenantEmail,
      "advanceAmount": model.advanceAmount
    };
    print(req);
    final response =
        await http.post(Uri.parse(Api.updateTenant), body: jsonEncode(req));
    final ResponseBode = jsonEncode(response.body);
    print(ResponseBode);
    if (response.statusCode == 200) {
      BlocProvider.of<AddtenantBloc>(context).add(GetTenantEvent());
      Navigator.pop(context);
      print("done");
    } else {
      print("potti");
    }
  }
}
