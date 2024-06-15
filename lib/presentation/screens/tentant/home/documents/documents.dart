import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/add_docs.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class DocumentsAddAndViewScreenTenant extends StatefulWidget {
  const DocumentsAddAndViewScreenTenant({super.key});

  @override
  State<DocumentsAddAndViewScreenTenant> createState() =>
      _DocumentsAddAndViewScreenTenantState();
}

class _DocumentsAddAndViewScreenTenantState
    extends State<DocumentsAddAndViewScreenTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => customNavPush(context, const AddDocumentsScreen()),
        child: Container(
          decoration: BoxDecoration(
              color: contsGreen, borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
            width: 222,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    'Add Document Images',
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 233, 230),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 100,
                              child:
                                  Image.asset('assets/images/onboarding2.png')),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Data',
                                    style: GoogleFonts.rubik(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'data',
                                    style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.delete_simple,
                                      color: contsGreen))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 100,
                              child:
                                  Image.asset('assets/images/onboarding2.png')),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Data',
                                    style: GoogleFonts.rubik(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'data',
                                    style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.delete_simple,
                                      color: contsGreen))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
