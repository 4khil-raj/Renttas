// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_bill/add_bill.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Rent Bill',
        onTap: () => customNavPush(context, TenantAddBillScreen()),
      ),
      body: Center(
        child: Text('Bill Not found!'),
      ),
    );
  }
}
