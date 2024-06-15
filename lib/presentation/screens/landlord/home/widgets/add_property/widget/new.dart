import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/widget/custom_cart_fields.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class AddNewProperty extends StatelessWidget {
  AddNewProperty({super.key});
  final propertyNameController = TextEditingController();
  final subPropertyNameController = TextEditingController();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Add Property',
          style: GoogleFonts.poppins(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: contsGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            AddExpenseFields(
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
              controller: locationController,
              hitText: 'Location',
              icon: Icon(
                Icons.location_on,
                color: contsGreen,
              ),
              name: 'Location*',
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
