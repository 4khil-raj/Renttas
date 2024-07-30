import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import "package:http/http.dart" as http;
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class UpdateTenantRepo {
  static updateTenant(AddTenantModel model, String id, context) async {
    Map<String, dynamic> req = {
      "tenantid": id,
      "tenantName": model.tenantName,
      "phone": model.mobileNumber,
      "email": model.tenantEmail,
      "advanceAmount": model.advanceAmount
    };
    final response =
        await http.post(Uri.parse(Api.updateTenant), body: jsonEncode(req));

    if (response.statusCode == 200) {
      BlocProvider.of<AddtenantBloc>(context).add(GetTenantEvent());
      Navigator.pop(context);
    } else {
      alerts(context, "try again");
    }
  }
}
