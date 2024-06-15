import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/custom_charges.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/floating_button.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/monthly.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/other.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/rent_cycle.dart';

class TenantAddBillScreen extends StatelessWidget {
  const TenantAddBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddBillCustomFloatingButton(),
      backgroundColor: const Color.fromARGB(255, 242, 239, 239),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Bill',
          style: GoogleFonts.urbanist(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: contsGreen,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddbillRentCycle(),
              AddBillMonthlyChargesScreen(),
              AddBillOtherChargesScreen(),
              AddBillCustomChargesScreen()
            ],
          ),
        ),
      ),
    );
  }
}
