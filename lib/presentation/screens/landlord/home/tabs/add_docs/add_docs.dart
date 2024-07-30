import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renttas/application/image_picker/imagepicker_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/create_document/model.dart';
import 'package:renttas/infrastructure/repository/create_document/repo.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/file_pick.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/widgets/fields.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key});

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  final descriptionController = TextEditingController();
  final documentnameController = TextEditingController();
  XFile? selectedImage;

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
                    addImage(context);
                  },
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: BlocBuilder<ImagepickerBloc, ImagepickerState>(
                        builder: (context, state) {
                          if (state is ImageCameraSuccess) {
                            selectedImage = state.image;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  child: Image.file(
                                    File(state.image.path),
                                    fit: BoxFit.cover,
                                  )),
                            );
                          } else if (state is PickerErrorState) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              alerts(context, state.messege);
                            });
                          }
                          return const Icon(
                            Icons.add,
                            size: 120,
                          );
                        },
                      )),
                ),
              ),
              AddDocumentCustomFields(
                  documentnameController: documentnameController,
                  descriptionController: descriptionController),
              CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () {
                  CreateDocument model = CreateDocument(
                      dec: descriptionController.text,
                      file: selectedImage!,
                      docName: documentnameController.text,
                      propertyID: currentPropertyId,
                      subPropertyId: currentSubpropertyId,
                      mobileNum: '');
                  UploadDocumentRepository()
                      .uploadFile(model: model, context: context);
                },
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
