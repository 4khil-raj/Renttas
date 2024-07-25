import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/domain/models/add_tenant/model.dart';
import 'package:renttas/infrastructure/repository/deleteTenant/repo.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_tenant/add_tenant.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class GetTenantBuilderLandlordScreen extends StatelessWidget {
  const GetTenantBuilderLandlordScreen({super.key, required this.state});
  final TenantAddSuccess state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 206, 204, 204),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            (index + 1).toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                state.list[index].tenantName,
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ),
                            Text(
                              state.list[index].phone,
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "₹ ${state.list[index].advanceAmount}",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              AddTenantModel model = AddTenantModel(
                                  advanceAmount:
                                      state.list[index].advanceAmount,
                                  endDate: state.list[index].endDate.toString(),
                                  mobileNumber: state.list[index].phone,
                                  tenantName: state.list[index].tenantName,
                                  propertyid: "",
                                  startDate:
                                      state.list[index].startDate.toString(),
                                  subPropertyId: "",
                                  tenantEmail: state.list[index].email,
                                  uid: state.list[index].id);
                              customNavPush(
                                  context,
                                  AddTenantScreen(
                                    model: model,
                                    isEdit: true,
                                  ));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              // customNavPush(context, )

                              alertsWithButtons(
                                  context, "Do you want to delete", () {
                                DeleteTenantRepo.deleteTenant(
                                    state.list[index].id, context);
                              }, "Delete");
                            },
                            icon: Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
