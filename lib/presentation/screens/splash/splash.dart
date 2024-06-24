import 'package:flutter/material.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/main.dart';
import 'package:renttas/presentation/screens/landlord/home/home.dart';
import 'package:renttas/presentation/screens/onboarding/onboarding.dart';
import 'package:renttas/presentation/screens/tentant/home/home.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetTenantRepo.getTenantReq("5aef9a22-11c8-4058-9a31-cd8b5aac6ffa",
        "7dfdded0-a221-4ddc-9177-8ec0a4faee17");
    getUserModel();
    Future.delayed(const Duration(seconds: 2), () {
      checkUserLogin(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }

  Future<void> checkUserLogin(context) async {
    final sharedpreference = await SharedPreferences.getInstance();
    final userlogin = sharedpreference.getString(loginTocken);

    if (userlogin == 'user') {
      customNavRemoveuntil(context, const TenantWelcomeHomeScreen());
    } else if (userlogin == "admin") {
      customNavRemoveuntil(context, const LandlordHomeScreen());
    } else {
      customNavRemoveuntil(context, const OnBoardingScreen1());
    }
  }
}
