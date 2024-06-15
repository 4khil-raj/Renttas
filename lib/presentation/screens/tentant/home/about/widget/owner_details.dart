import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TenantAboutOwnerDetails extends StatelessWidget {
  const TenantAboutOwnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property Owner Details :',
            style:
                GoogleFonts.urbanist(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Owner Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  '',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'PAN',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  '',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ))
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
