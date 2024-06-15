import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/bottomsheets/rent_cycle/rent_cycle.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/widgets/addbutton.dart';

class AddbillRentCycle extends StatelessWidget {
  const AddbillRentCycle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'When Do You Collect Rent',
          style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Card(
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Text(
                    'Rent Cycle',
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CustomAddButton(
                    containerWidth: 80,
                    onTap: () {
                      rentCycleBottomSheet(context);
                    },
                    text: 'Add',
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
