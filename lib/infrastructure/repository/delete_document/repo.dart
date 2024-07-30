import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/application/get_document/getdocument_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class DeleteDocumentRepo {
  static void delete(String id, context) async {
    try {
      final response = await http.post(Uri.parse(Api.deleteDocuments),
          body: jsonEncode({"docid": id}));
      if (response.statusCode == 200) {
        BlocProvider.of<GetdocumentBloc>(context).add(GetDocEvent());
      } else {
        alerts(context, "Try Again");
      }
    } catch (e) {
      alerts(context, e.toString());
    }
  }
}
