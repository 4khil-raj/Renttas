// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/bill_fetch/propertybillfetch_bloc.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/add_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/appbar.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Rent Bill',
        onTap: () => customNavPush(context, TenantAddBillScreen()),
      ),
      body: BlocBuilder<PropertybillfetchBloc, PropertybillfetchState>(
        builder: (context, state) {
          if (state is BillLoadedSucussState) {
            return Center(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black87)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                          height: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 35,
                            child: Text(
                              ' 08 Jun',
                              style: GoogleFonts.inter(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text("$selectpropertyName",
                              style: GoogleFonts.inter(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.red[100]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.billList[0].rentAmount,
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.green[50]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                state.billList[0].gasBillCharge.toString(),
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w700)),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.black45)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share,
                                  size: 30,
                                  color: contsGreen,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('Share',
                                    style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: () => openWhatsAppChat('+918943514279'),
                          child: Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.wh,
                                  //   size: 30,
                                  //   color: contsGreen,
                                  // ),
                                  Container(
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/whatsapp icon.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  Text('WhatsApp',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.black45)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.download,
                                  size: 30,
                                  color: contsGreen,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text('Download',
                                    style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
          } else if (state is EmptyState) {
            return Center(
              child: Text('Bill Not found'),
            );
          }
          return Center(
            child: Text('Bill Not found!'),
          );
        },
      ),
    );
  }
}
