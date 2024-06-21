import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/add_property/addproperty_bloc.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/domain/models/add_property/models.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class AddNewProperty extends StatelessWidget {
  AddNewProperty({super.key});
  final propertyNameController = TextEditingController();
  final subPropertyNameController = TextEditingController();
  final locationController = TextEditingController();
  final pincodeController = TextEditingController();
  bool request = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Add Property',
            style: GoogleFonts.poppins(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: contsGreen,
        ),
        body: BlocBuilder<AddpropertyBloc, AddpropertyState>(
          builder: (context, state) {
            if (state is AddpropertySuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                BlocProvider.of<FetchpropertyBloc>(context)
                    .add(FetchPropertyreqEvent(uid: userModel!.uid));
                Navigator.pop(context);
                BlocProvider.of<AddpropertyBloc>(context)
                    .add(AddpropertyEvent());
              });
            } else if (state is AddpropertyErrorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                alerts(context, state.message);
                BlocProvider.of<AddpropertyBloc>(context)
                    .add(AddpropertyEvent());
              });
            } else if (state is PostRequstedState) {
              request = true;
            } else {
              request = false;
            }
            return Padding(
                padding: const EdgeInsets.all(11.0),
                child: SingleChildScrollView(
                    child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  AddExpenseFields(
                    keyboardType: TextInputType.name,
                    controller: propertyNameController,
                    hitText: 'Property Name',
                    icon: Icon(
                      Icons.location_city_rounded,
                      color: contsGreen,
                    ),
                    name: 'Property Name*',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddExpenseFields(
                    keyboardType: TextInputType.name,
                    controller: subPropertyNameController,
                    hitText: 'Sub Property Name',
                    icon: Icon(
                      Icons.location_city,
                      color: contsGreen,
                    ),
                    name: 'Sub Property Name*',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddExpenseFields(
                    keyboardType: TextInputType.name,
                    controller: locationController,
                    hitText: 'Location',
                    icon: Icon(
                      Icons.location_on,
                      color: contsGreen,
                    ),
                    name: 'Location*',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddExpenseFields(
                    keyboardType: TextInputType.number,
                    controller: pincodeController,
                    hitText: 'Pincode',
                    icon: Icon(
                      Icons.location_on,
                      color: contsGreen,
                    ),
                    name: 'Pincode*',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      isNetwork: false,
                      isRow: false,
                      onTap: () {
                        addProperty(context);
                      },
                      textclr: Colors.white,
                      borderclr: contsGreen,
                      color: contsGreen,
                      fontweight: FontWeight.w500,
                      name: 'Submit',
                      height: 60,
                      radius: 10,
                      textsize: 16,
                      width: double.infinity,
                    ),
                  )
                ])));
          },
        ));
  }

  void addProperty(context) {
    AddPropertyModel model = AddPropertyModel(
        propertyName: propertyNameController.text,
        location: locationController.text,
        subPropertyName: subPropertyNameController.text,
        pincode: pincodeController.text);
    BlocProvider.of<AddpropertyBloc>(context)
        .add(AddPropertyRequstEvent(model: model));
  }
}
