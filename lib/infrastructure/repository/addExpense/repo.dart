import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renttas/application/fetch_expense/fetchexpense_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/addExpense/model.dart';
import "package:http/http.dart" as http;
import 'package:renttas/infrastructure/repository/fetchExpense/repo.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class AddExpenseRepo {
  static addExpense(AddExpenseModel model, context) async {
    Map<String, dynamic> addreq = {
      "landlordId": model.uid,
      "propertyId": model.propertyID,
      "subPropertyId": model.subPropertyId,
      "category": model.category,
      "name": model.name,
      "amount": model.amount,
      "expensesDate": model.expensesDate,
      "description": model.description
    };

    try {
      final response = await http.post(
          Uri.parse(
            Api.addExpense,
          ),
          body: jsonEncode(addreq));

      if (response.statusCode == 200) {
        Navigator.pop(context);
        BlocProvider.of<FetchexpenseBloc>(context).add(GetExepenseEvent());
      } else {
        alerts(context, "Try again!");
      }
    } catch (e) {
      alerts(context, e.toString());
    }
  }
}
