import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TenantUserDetailsProfileScreen extends StatelessWidget {
  const TenantUserDetailsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Text(
            'User Profile :-',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Card(
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'username',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  'username@gmail.com',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  '+9189435142**',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
