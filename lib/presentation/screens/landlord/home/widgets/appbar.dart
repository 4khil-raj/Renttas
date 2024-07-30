import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/add_tenant/addtenant_bloc.dart';
import 'package:renttas/application/bill_fetch/propertybillfetch_bloc.dart';
import 'package:renttas/application/fetch_address/fetchaddress_bloc.dart';
import 'package:renttas/application/fetch_expense/fetchexpense_bloc.dart';
import 'package:renttas/application/fetch_property/fetchproperty_bloc.dart';
import 'package:renttas/application/get_document/getdocument_bloc.dart';
import 'package:renttas/application/property_select/propertyselecter_bloc.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/presentation/screens/landlord/home/addroom.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/profile.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/add_property.dart';
import 'package:renttas/presentation/screens/landlord/premium/premium.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

dynamic selectedPropertyId;
dynamic selectpropertyName;
dynamic selectedSubPropertyName;

class TenantHomeScreenCustomAppBar extends StatelessWidget {
  const TenantHomeScreenCustomAppBar({super.key});
  String _getInitials(String name) {
    List<String> parts = name.split(' ');
    if (parts.length >= 2) {
      String firstName = parts[0];
      String lastName = parts[parts.length - 1];
      return '${firstName[0]}${lastName[0]}'.toUpperCase();
    } else if (parts.length == 1) {
      return '${parts[0][0]}'.toUpperCase();
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String initials = userModel != null ? _getInitials(userModel!.name) : '';
    return Container(
      height: 150,
      color: const Color.fromARGB(255, 82, 144, 83),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () =>
                      customNavPush(context, const TenantProfileScreen()),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(initials),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<FetchpropertyBloc>(context)
                      .add(FetchPropertyreqEvent(uid: userModel!.uid));
                  addPropertyBottomSheet(context);
                },
                child: Row(
                  children: [
                    ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 120, minWidth: 80),
                        child: BlocBuilder<PropertyselecterBloc,
                            PropertyselecterState>(
                          builder: (context, state) {
                            if (state is PropertySelectedState) {
                              selectedPropertyId = state.id;
                              selectpropertyName = state.selectedProperty;
                              selectedSubPropertyName = state.subPropertyName;
                              BlocProvider.of<AddtenantBloc>(context)
                                  .add(GetTenantEvent());
                              BlocProvider.of<FetchexpenseBloc>(context)
                                  .add(GetExepenseEvent());
                              BlocProvider.of<PropertybillfetchBloc>(context)
                                  .add(PropertyBillFetchEvent(
                                      propertyId: currentPropertyId,
                                      subpropertyId: currentSubpropertyId));
                              BlocProvider.of<FetchaddressBloc>(context)
                                  .add(FetchAddressReq());
                              BlocProvider.of<GetdocumentBloc>(context)
                                  .add(GetDocEvent());

                              return Text(state.selectedProperty,
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white));
                            }
                            return Text('select Property',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white));
                          },
                        )),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 27,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell_solid,
                      color: Colors.white)),
              TextButton.icon(
                  // style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(
                  //   Colors.white24,
                  // )),
                  onPressed: () =>
                      customNavPush(context, const PremiumUpgradingScreen()),
                  icon: Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber[600],
                  ),
                  label: Text(
                    "Premium",
                    style: TextStyle(fontSize: 14, color: Colors.amber[600]),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text('WELCOME',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white)),
              const Spacer(),
              TextButton.icon(
                  // style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(
                  //   Colors.white24,
                  //
                  // )),
                  onPressed: () =>
                      customNavPush(context, TenantAddRoomScreen()),
                  icon: const Icon(
                    Icons.add_box,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "ADD ROOM",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
