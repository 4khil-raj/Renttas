import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

class LatestBillTenant extends StatelessWidget {
  const LatestBillTenant({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        child: Text('USERNAME-username',
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
                          child: Text('₹ 3000.0',
                              style: GoogleFonts.urbanist(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.green[50]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('₹ 0.0',
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
                                width: 8,
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
    );
  }
}
