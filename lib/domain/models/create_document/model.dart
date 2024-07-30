import 'package:image_picker/image_picker.dart';

class CreateDocument {
  final XFile file;
  final String docName;
  final String propertyID;
  final String subPropertyId;
  final String mobileNum;
  final String dec;
  CreateDocument({
    required this.dec,
    required this.file,
    required this.docName,
    required this.propertyID,
    required this.subPropertyId,
    required this.mobileNum,
  });
}
