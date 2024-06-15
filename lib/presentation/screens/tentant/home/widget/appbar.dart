import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';

class TenantappBar extends StatelessWidget {
  const TenantappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: contsGreen,
      title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('UN'),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Welcome',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            Text('USER NAME',
                style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
