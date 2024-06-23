import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/widget/dates.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/widget/phone.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

final addtenantphonenumberController = TextEditingController();
final addTenantstartDate = TextEditingController();
final addTenantendDate = TextEditingController();

class AddTenantScreen extends StatelessWidget {
  AddTenantScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final amountController = TextEditingController();
  dynamic startDate;
  dynamic endDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contsGreen,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Add Tenant',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              AddExpenseFields(
                keyboardType: TextInputType.name,
                controller: nameController,
                hitText: 'Tenant Name',
                icon: Icon(
                  Icons.person,
                  color: contsGreen,
                ),
                name: 'Tenant Name*',
              ),
              AddExpenseFields(
                keyboardType: TextInputType.name,
                controller: emailController,
                hitText: 'Email Id',
                icon: Icon(
                  Icons.person,
                  color: contsGreen,
                ),
                name: 'Email Id (Optional)*',
              ),
              AddExpenseFields(
                keyboardType: TextInputType.number,
                controller: amountController,
                hitText: 'Amount',
                icon: Icon(
                  Icons.attach_money_sharp,
                  color: contsGreen,
                ),
                name: 'Advance Amount*',
              ),
              const AddTenantPhoneField(),
              const AddTenantsDatesScreen(),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () => addTenant(context),
                textclr: Colors.white,
                borderclr: contsGreen,
                color: contsGreen,
                fontweight: FontWeight.w500,
                name: 'Submit',
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

  void addTenant(context) {
    // AddTenantModel model = AddTenantModel(
    //     propertyid: currentPropertyId,
    //     subPropertyId: currentSubpropertyId,
    //     tenantName: nameController.text,
    //     tenantEmail: emailController.text,
    //     advanceAmount: amountController.text,r
    //     mobileNumber: addtenantphonenumberController.text,
    //     startDate: addTenantstartDate.text,
    //     endDate: addTenantendDate.text,
    //     uid: userModel!.uid);
    print(currentPropertyId);
    print(currentSubpropertyId);

    // BlocProvider.of<AddtenantBloc>(context)
    //     .add(AddTenantRequstEvent(model: model));
  }
}
