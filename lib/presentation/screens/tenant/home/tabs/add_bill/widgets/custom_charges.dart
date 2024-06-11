import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_bill/widgets/addbutton.dart';

class AddBillCustomChargesScreen extends StatelessWidget {
  const AddBillCustomChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Monthly Fixed Charges',
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700),
            ),
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
                    Row(children: [
                      Text(
                        'Custom Charges',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CustomAddButton(
                        containerWidth: 80,
                        onTap: () {},
                        text: 'Add',
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ])
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
