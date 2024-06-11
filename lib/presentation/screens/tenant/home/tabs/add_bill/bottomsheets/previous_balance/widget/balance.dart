import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_bill/bottomsheets/previous_balance/previous_balance.dart';

class PreviousBalanceContainers extends StatefulWidget {
  const PreviousBalanceContainers({super.key});

  @override
  State<PreviousBalanceContainers> createState() =>
      _PreviousBalanceContainersState();
}

class _PreviousBalanceContainersState extends State<PreviousBalanceContainers> {
  bool monthly = false;
  bool pending = false;
  bool nobalance = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        // Text(
        //   'When do you collect rent',
        //   style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () => setState(() {
                  previousBalance = 'Monthly';
                  monthly = true;
                  pending = false;
                  nobalance = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: monthly ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Monthly',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () => setState(() {
                  previousBalance = 'Pending';
                  pending = true;
                  monthly = false;
                  nobalance = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: pending ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Pending',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () => setState(() {
                  previousBalance = 'No Balance';
                  pending = false;
                  monthly = false;
                  nobalance = true;
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: nobalance ? contsGreen : Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  height: 37,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No Balance',
                        style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
