import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_docs/widgets/fields.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider
import 'dart:io'; // Import dart:io for File operations

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key});

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  final descriptionController = TextEditingController();
  final documentnameController = TextEditingController();
  PlatformFile? documentPicker;
  String? pdfFilePath;
  Future<void> pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;
      if (pickedFile != null) {
        setState(() {
          documentPicker = pickedFile;
        });

        // Save the picked file to a temporary location
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/${documentPicker!.name}');
        await tempFile.writeAsBytes(documentPicker!.bytes!);

        setState(() {
          pdfFilePath = tempFile.path;
        });
      } else {
        // Handle case where picked file is null
        print('Picked file is null');
      }
    } else {
      // User canceled the picker or no file was picked
      setState(() {
        documentPicker = null;
        pdfFilePath = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contsGreen,
        title: Text(
          'Add Document',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload a document file',
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    pickDocument();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: pdfFilePath != null
                        ? PDFView(
                            filePath: pdfFilePath,
                          )
                        : const Icon(
                            Icons.add,
                            size: 120,
                          ),
                  ),
                ),
              ),
              AddDocumentCustomFields(
                  documentnameController: documentnameController,
                  descriptionController: descriptionController),
              CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () {},
                textclr: Colors.white,
                borderclr: contsGreen,
                color: contsGreen,
                fontweight: FontWeight.w500,
                name: 'Save',
                height: 50,
                radius: 10,
                textsize: 16,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
