import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarAddPropertys extends StatefulWidget {
  const AppBarAddPropertys({super.key});

  @override
  State<AppBarAddPropertys> createState() => _AppBarAddPropertysState();
}

class _AppBarAddPropertysState extends State<AppBarAddPropertys> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.6;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: containerWidth,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Property',
                      style: GoogleFonts.urbanist(
                          fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.check_circle_outline_sharp,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
