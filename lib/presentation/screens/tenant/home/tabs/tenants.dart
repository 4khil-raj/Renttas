// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:renttas/presentation/screens/tenant/home/tabs/widgets/floating_button.dart';

class HomeTenantsTab extends StatelessWidget {
  const HomeTenantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Tenant',
        onTap: () {},
      ),
      body: Center(
        child: Text('Tenant Not found!'),
      ),
    );
  }
}
