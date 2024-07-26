// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/owner_address.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/about/property_address.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/appbar.dart';
import 'package:renttas/presentation/widgets/buttons/custom_button.dart';

class HomeAboutTab extends StatelessWidget {
  const HomeAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, top: 10, bottom: 10),
                    child: CustomButton(
                      isNetwork: false,
                      isRow: false,
                      onTap: () {},
                      borderclr: Colors.green,
                      color: const Color.fromARGB(255, 82, 144, 83),
                      fontweight: FontWeight.w500,
                      radius: 10,
                      textclr: Colors.white,
                      name: 'Property Details',
                      height: 45,
                      textsize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 7, bottom: 7),
                    child: Text(
                      'Details :',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 7, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Property name :-',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text('$selectpropertyName',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Owner name :-',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        Text('${userModel?.name}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => ownerAddressSheet(context),
                        child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Color.fromARGB(255, 82, 144, 83),
                                  ),
                                  Text(
                                    "Address",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 82, 144, 83)),
                                  ),
                                ])),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () => propertyAddressSheet(context),
                        child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Color.fromARGB(255, 82, 144, 83),
                                  ),
                                  Text(
                                    "Owner details",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 82, 144, 83)),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TabBar(
                      indicatorColor: Color.fromARGB(255, 82, 144, 83),
                      labelColor: Color.fromARGB(255, 82, 144, 83),
                      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      // isScrollable: true,
                      tabs: [
                        Text('Address', style: TextStyle(fontSize: 18)),
                        Text('Details', style: TextStyle(fontSize: 18)),
                      ]),
                  SizedBox(
                      height: 400,
                      child: TabBarView(children: [
                        Center(
                          child: Text("No Address Found"),
                        ),
                        Center(
                          child: Text("No Details Found"),
                        )
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
