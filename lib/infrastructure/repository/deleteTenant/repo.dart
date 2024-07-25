import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class DeleteTenantRepo {
  static Future deleteTenant(tenantId, context) async {
    final response = await http.post(Uri.parse(Api.deleteTenant),
        body: jsonEncode({"tenantid": tenantId}));

    if (response.statusCode == 200) {
      Navigator.pop(context);
      BlocProvider.of<AddtenantBloc>(context).add(GetTenantEvent());
    } else {
      alerts(context, "Try Again");
    }
  }
}
