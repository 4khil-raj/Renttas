// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/add_tenant/add_tenant.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeTenantsTab extends StatelessWidget {
  const HomeTenantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Tenant',
        onTap: () => customNavPush(context, AddTenantScreen()),
      ),
      body: Center(
        child: Text('Tenant Not found!'),
      ),
    );
  }
}
