import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/presentation/screens/landlord/home/addroom.dart';
import 'package:renttas/presentation/screens/landlord/home/profile/profile.dart';
import 'package:renttas/presentation/screens/landlord/home/widgets/add_property/add_property.dart';
import 'package:renttas/presentation/screens/landlord/premium/premium.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class TenantHomeScreenCustomAppBar extends StatelessWidget {
  const TenantHomeScreenCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('A'),
                  ),
                ),
              ),
              InkWell(
                onTap: () => addPropertyBottomSheet(context),
                child: Row(
                  children: [
                    ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 120, minWidth: 80),
                        child: Text('Property',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white))),
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
