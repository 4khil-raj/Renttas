import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/electricity/electricity.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/gas_bill/gas_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/water_bill/water_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';

class AddBillOtherChargesScreen extends StatelessWidget {
  const AddBillOtherChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 13.0, left: 13, right: 13, bottom: 13),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Other Fixed Charges',
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Electricity bill type',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CustomAddButton(
                        containerWidth: 80,
                        onTap: () => electricityBillBottomSheet(context),
                        text: 'Add',
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Text(
                        'Water bill type',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CustomAddButton(
                        containerWidth: 80,
                        onTap: () => waterBillBottomSheet(context),
                        text: 'Add',
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Text(
                        'Gas bill type',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CustomAddButton(
                        containerWidth: 80,
                        onTap: () => gasBillBottomSheet(context),
                        text: 'Add',
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
