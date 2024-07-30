import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:renttas/application/get_document/getdocument_bloc.dart';
import 'package:renttas/core/api/apis.dart';
import 'package:renttas/domain/models/create_document/model.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';

class UploadDocumentRepository {
  Future<void> uploadFile({required CreateDocument model, context}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(Api.createDocumet));

      request.fields['docname'] = model.docName;
      request.fields['doctype'] = 'file';
      request.fields['propertyid'] = model.propertyID;
      request.fields['subPropertyid'] = model.subPropertyId;
      request.fields['mobileNumber'] = '';
      request.fields['description'] = model.dec;

      var mimeTypeData = lookupMimeType(model.file.path)!.split('/');
      var fileStream = http.ByteStream(Stream.castFrom(model.file.openRead()));
      var fileLength = await model.file.length();
      var multipartFile = http.MultipartFile(
        'file',
        fileStream,
        fileLength,
        filename: basename(model.file.path),
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      request.files.add(multipartFile);
      var response = await request.send();
      if (response.statusCode == 200) {
        Navigator.pop(context);
        BlocProvider.of<GetdocumentBloc>(context).add(GetDocEvent());
      } else {
        alerts(context, "Try Again");
      }
    } catch (e) {
      alerts(context, e.toString());
    }
  }
}
