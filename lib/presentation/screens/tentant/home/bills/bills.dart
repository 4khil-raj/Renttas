import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/get_tenant_bill/get_tenant_bill_bloc.dart';
import 'package:renttas/main.dart';
import 'package:url_launcher/url_launcher.dart';

class LatestBillTenant extends StatelessWidget {
  const LatestBillTenant({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTenantBillBloc, GetTenantBillState>(
      builder: (context, state) {
        if (state is FetchedTenantBillState) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                children: [
                  Container(
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
                                    ' ${state.list[index].endDate}',
                                    style: GoogleFonts.inter(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // width: 120,
                                child: Text(state.list[index].tenantName,
                                    style: GoogleFonts.inter(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800)),
                              ),
                              Spacer(),
                              const SizedBox(
                                width: 11,
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.red[100]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "₹${state.list[index].advanceAmount}",
                                      style: GoogleFonts.urbanist(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.green[50]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('₹ 0.0',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              // Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
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
                                      border:
                                          Border.all(color: Colors.black45)),
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
                              Expanded(
                                child: InkWell(
                                  onTap: () =>
                                      openWhatsAppChat(state.list[index].phone),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black45)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 0.0),
                                          child: Text('WhatsApp',
                                              style: GoogleFonts.urbanist(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700)),
                                        )
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
                                      border:
                                          Border.all(color: Colors.black45)),
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
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('No Bills Found'),
        );
      },
    );
  }

  void openWhatsAppChat(String phoneNumber) async {
    final whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=Hello!";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
 // const SizedBox(
                              //   width: 8,
                              // ),